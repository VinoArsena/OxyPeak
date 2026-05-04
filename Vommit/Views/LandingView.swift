import SwiftUI

struct LandingView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Image(systemName: "mountain.2")
                        .font(.largeTitle)
                        .padding(24)
                    
                    Text("VOMMIT")
                        .font(.largeTitle.bold())
                    
                    Spacer()
                    
                    Text("Check minimum **VO₂ Max** \nto safely summit")
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink {
                        HealthSyncTestView()
                    } label: {
                        Text("Tap here to start")
                    }
                    
                    
                    Spacer()
                    
                    Text("Based on research from\nAmerican College of Sports Medicine")
                        .multilineTextAlignment(.center)
                        .fontWeight(.thin)
                        .font(.caption.italic())
                }
                .padding(24)
                .frame(maxWidth: .infinity)
            }
            .preferredColorScheme(.dark)
            .background(Color("Background"))
        }
    }
}

#Preview {
    LandingView()
}
