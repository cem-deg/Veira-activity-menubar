import Foundation

struct TrackedSession {
    let id: UUID
    let startedAt: Date
    let endedAt: Date
    let segments: [ActivitySegment]
}
