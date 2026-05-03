import SwiftUI

struct SetupAutoView: View {
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("Sync Automatically")
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
    SetupAutoView()
}

