import SwiftUI
import SwiftData

@main
struct OxyPeakApp: App {
    @State var currentUser: User?

    var body: some Scene {
        WindowGroup {
            LandingView(user: $currentUser)
                .preferredColorScheme(.dark)
                .background(Color("Background")).ignoresSafeArea()
        }
    }
}
