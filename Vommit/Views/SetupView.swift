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
                
                VStack(spacing: 24) {
                    HStack(spacing: 16) {
                        Image(systemName: "applewatch.radiowaves.left.and.right")
                            .font(.title)
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Sync from Apple Watch")
                                .font(.headline)
                            Text("Automatically sync your VO₂ max data from apple watch")
                        }
                        Image(systemName: "chevron.right")
                            .font(.headline.bold())
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .background(Color("CardBackground"))
                    .cornerRadius(26)
                    
                    HStack(spacing: 16) {
                        Image(systemName: "gearshape.2.fill")
                            .font(.title)
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Sync from Apple Watch")
                                .font(.headline)
                            Text("Automatically sync your VO₂ max data from apple watch")
                        }
                        Image(systemName: "chevron.right")
                            .font(.headline.bold())
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .background(Color("CardBackground"))
                    .cornerRadius(26)
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
    InputView()
}
