import SwiftUI

struct AnalysisView: View {
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("Analysis")
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
    AnalysisView()
}
