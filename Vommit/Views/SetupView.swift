import SwiftUI

struct InputView: View {

    var body: some View {
        
        ZStack {
            VStack {
                Text("Input VO₂ Max")
                    .font(.title.bold())
                
                Text("Choose preferred method")
                    .font(.callout)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .padding(24)
        }
        .preferredColorScheme(.dark)
        .background(Color("Background"))
        
    }

}

#Preview {
    InputView()
}
