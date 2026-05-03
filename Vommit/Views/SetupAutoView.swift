import SwiftUI

struct SetupAutoView: View {
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("Sync Automatically")
                    .font(.title.bold())
                
                Spacer()
                
                Image(systemName: "applewatch")
                    .font(.largeTitle)
                    .background(Color("CardBackground"))
                    .cornerRadius(26)
                
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
    SetupAutoView()
}

