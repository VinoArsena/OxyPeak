import SwiftUI
import SwiftData

@main
struct VommitApp: App {

    var body: some Scene {
        WindowGroup {
            LandingView()
                .preferredColorScheme(.dark)
                .background(Color("Background")).ignoresSafeArea()
        }
    }
}
