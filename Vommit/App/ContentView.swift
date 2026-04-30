import SwiftUI
import SwiftData

struct ContentView: View {

    var body: some View {
        Text("VOMMIT")
            .bold()
            .font(.largeTitle)
            .padding()
        
        Text("Check minum **VO\u{2082}Max** \nto safely summit")
            .multilineTextAlignment(.center)
            .padding()
        
        Image(systemName: "mountain.2")
            .font(.largeTitle)
            .padding()
        
        Text("Tap here to start")
        
        Text("Based on research from\nAmerican College of Sports Medicine")
            .multilineTextAlignment(.center)
            .fontWeight(.thin)
            .italic()
            .font(.caption)
            .padding()
    }
}

#Preview {
    ContentView()
}
