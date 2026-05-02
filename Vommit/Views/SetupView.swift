import SwiftUI

struct InputView: View {

    var body: some View {
        Text("Input VO₂ Max")
            .font(.largeTitle.bold())
        
        Text("Choose preferred method")
            .font(.callout)
            .multilineTextAlignment(.center)
        
        Spacer()
        
    }

}

#Preview {
    InputView()
        .preferredColorScheme(.dark)
        .background(Color("Background").ignoresSafeArea())
}
