import SwiftUI

struct SetupManualView: View {
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("Input Info Manually")
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
    SetupManualView()
}

