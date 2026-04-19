import Foundation

enum SessionState {
    case idle
    case active
    case paused

    var statusLabel: String {
        switch self {
        case .idle:   return "No Active Session"
        case .active: return "Session Active"
        case .paused: return "Session Paused"
        }
    }
}

final class AppState: ObservableObject {
    @Published private(set) var sessionState: SessionState = .idle
    @Published var hasCompletedOnboarding: Bool = false

    private let monitor = ActiveAppMonitor()
    private let buffer = ActivityEventBuffer()
    private let segmentBuilder = ActivitySegmentBuilder()

    private var sessionStartedAt: Date?
    private var workDays: [WorkDayRecord] = []

    init() {
        monitor.onEvent = { [weak self] event in
            self?.buffer.append(event)
            self?.segmentBuilder.handle(event)
        }
    }

    var completedSegments: [ActivitySegment] {
        segmentBuilder.closedSegments
    }

    func startSession() {
        guard sessionState == .idle else { return }
        sessionStartedAt = Date()
        sessionState = .active
        monitor.start()
    }

    func pauseSession() {
        guard sessionState == .active else { return }
        sessionState = .paused
        monitor.stop()
        segmentBuilder.closeCurrentSegment(at: Date())
    }

    func resumeSession() {
        guard sessionState == .paused else { return }
        sessionState = .active
        monitor.start()
    }

    func endSession() {
        let now = Date()

        switch sessionState {
        case .idle:
            return
        case .active:
            monitor.stop()
            segmentBuilder.closeCurrentSegment(at: now)
        case .paused:
            break
        }

        finalizeSession(endedAt: now)
        buffer.clear()
        sessionState = .idle
    }

    private func finalizeSession(endedAt: Date) {
        guard let startedAt = sessionStartedAt else { return }

        let session = TrackedSession(
            id: UUID(),
            startedAt: startedAt,
            endedAt: endedAt,
            segments: segmentBuilder.drainSegments()
        )

        let dayKey = Calendar.current.startOfDay(for: startedAt)
        if let idx = workDays.firstIndex(where: { $0.date == dayKey }) {
            workDays[idx].sessions.append(session)
        } else {
            workDays.append(WorkDayRecord(date: dayKey, sessions: [session]))
        }

        sessionStartedAt = nil
    }
}
