import SwiftUI

struct SetupAutoView: View {
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("Sync from Apple Watch")
                    .font(.title.bold())
                
                Spacer()
                
                Image(systemName: "applewatch")
                    .font(.largeTitle)
                    .background(Color("CardBackground"))
                    .cornerRadius(26)
                
                Spacer()
                
                Text("Automatically sync your VO₂ max data from apple watch")
                   
                
                Spacer()
                
//                Cara cari font gimana sih ?? Dan juga mau kasih kotak border gitu di tulisannya.
//                Vicz,
                
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

