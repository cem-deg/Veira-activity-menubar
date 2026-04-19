import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "eye.slash.fill")
                .font(.system(size: 48))
                .foregroundStyle(.secondary)

            Text("Welcome to Project Pulse")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Track where your development time goes.\nProject Pulse is private, local, and fully in your control.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)

            Button("Get Started") {
                // Onboarding completion logic will go here
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(48)
        .frame(width: 480, height: 360)
    }
}
