import SwiftUI
import SwiftData

@main
struct VommitApp: App {
    @State var currentUser: User?

    var body: some Scene {
        WindowGroup {
            LandingView(user: .constant(nil))
                .preferredColorScheme(.dark)
                .background(Color("Background")).ignoresSafeArea()
        }
    }
}
