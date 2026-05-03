import SwiftUI

struct SetupManualView: View {
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("Setup Profile")
                    .font(.title.bold())
                
                Text("Tell us about yourself")
                
                
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(24)
        }
        .preferredColorScheme(.dark)
        .background(Color("Background"))
        
    }
}

#Preview {
    SetupManualView()
}

