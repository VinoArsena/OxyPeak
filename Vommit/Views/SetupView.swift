import SwiftUI

struct SetupView: View {
    @State var navigateAuto = false
    @State var navigateManual = false
    
    @Binding var user: User?
    
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
                    Button {
                        navigateAuto = true
                    } label: {
                        HStack(spacing: 16) {
                            Image(systemName: "applewatch.radiowaves.left.and.right")
                                .font(.title)
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Sync from Health App")
                                    .font(.headline)
                                Text("Automatically sync your data gathered from your apple watch through Health app")
                            }
                            Image(systemName: "chevron.right")
                                .font(.headline.bold())
                        }
                        .padding(24)
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .background(Color("CardBackground"))
                        .cornerRadius(26)
                    }
                    .buttonStyle(.plain)
                    .navigationDestination(isPresented: $navigateAuto) {
                        SetupAutoView(user: $user)
                    }
                    
                    Button {
                        navigateManual = true
                    } label: {
                        HStack(spacing: 16) {
                            Image(systemName: "gearshape.2.fill")
                                .font(.title)
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Input Data Manually")
                                    .font(.headline)
                                Text("Enter your last recorded VO₂ max data from any resources")
                            }
                            Image(systemName: "chevron.right")
                                .font(.headline.bold())
                        }
                        .padding(24)
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .background(Color("CardBackground"))
                        .cornerRadius(26)
                    }
                    .buttonStyle(.plain)
                    .navigationDestination(isPresented: $navigateManual) {
                        SetupManualView(
                            name: "",
                            selectedGender: .others,
                            birthday: Date(),
                            user: $user
                        )
                    }
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
    SetupView(user: .constant(nil))
}
