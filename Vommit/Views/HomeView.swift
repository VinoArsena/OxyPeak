import SwiftUI

struct HomeView: View {
//    let mountains: [Mountain] = Mountain.sampleData
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("Choose Mountain")
                    .font(.title.bold())
                
                ScrollView {
                    
                }
                
                Spacer()
            }
            .padding(24)
        }
        .preferredColorScheme(.dark)
        .background(Color("Background"))
        
    }
}

#Preview {
    HomeView()
}

