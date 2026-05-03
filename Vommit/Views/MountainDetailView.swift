import SwiftUI

struct MountainDetailView: View {
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("MountainName")
                    .font(.title.bold())
                
                Spacer()
            }
            .padding(24)
        }
        .preferredColorScheme(.dark)
        .background(Color("Background"))
        
    }
}

#Preview {
    MountainDetailView()
}

