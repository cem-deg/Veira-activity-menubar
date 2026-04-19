import SwiftUI

struct DashboardView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                SessionStatusCard()
                DashboardSection(title: "Today Summary")
                DashboardSection(title: "Total Time")
                DashboardSection(title: "App Breakdown")
                DashboardSection(title: "Weekly View")
            }
            .padding(32)
        }
        .frame(minWidth: 640, minHeight: 480)
    }
}

private struct SessionStatusCard: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Session Status")
                .font(.title3)
                .fontWeight(.semibold)

            HStack(spacing: 10) {
                Circle()
                    .fill(appState.sessionState.indicatorColor)
                    .frame(width: 8, height: 8)
                Text(appState.sessionState.statusLabel)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.secondary.opacity(0.12))
            )
        }
    }
}

private struct DashboardSection: View {
    let title: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)

            RoundedRectangle(cornerRadius: 8)
                .fill(.secondary.opacity(0.12))
                .frame(maxWidth: .infinity)
                .frame(height: 72)
                .overlay(
                    Text("No data yet")
                        .font(.subheadline)
                        .foregroundStyle(.tertiary)
                )
        }
    }
}

private extension SessionState {
    var indicatorColor: Color {
        switch self {
        case .idle:   return Color.secondary
        case .active: return Color.green
        case .paused: return Color.orange
        }
    }
}
