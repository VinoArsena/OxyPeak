import SwiftUI

struct SetupAutoView: View {
    
    var body: some View {
        Text("Text")
    }
}

#Preview {
    SetupAutoView()
        .preferredColorScheme(.dark)
        .background(Color("Background").ignoresSafeArea())
}

