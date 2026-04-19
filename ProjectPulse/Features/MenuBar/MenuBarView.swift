import SwiftUI

struct MenuBarView: View {
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var dashboardController: DashboardWindowController

    var body: some View {
        Text("Project Pulse")
        Divider()
        Text(appState.sessionState.statusLabel)
        Divider()
        sessionControlButton
        Divider()
        Button("Open Dashboard") {
            dashboardController.open(appState: appState)
        }
        Divider()
        Button("Quit Project Pulse") {
            NSApplication.shared.terminate(nil)
        }
    }

    @ViewBuilder
    private var sessionControlButton: some View {
        switch appState.sessionState {
        case .idle:
            Button("Start Session") {
                appState.startSession()
            }
        case .active:
            Button("Pause Session") {
                appState.pauseSession()
            }
            Button("End Session") {
                appState.endSession()
            }
        case .paused:
            Button("Resume Session") {
                appState.resumeSession()
            }
            Button("End Session") {
                appState.endSession()
            }
        }
    }
}
