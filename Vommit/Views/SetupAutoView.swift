import SwiftUI

struct SetupAutoView: View {
    @State private var healthManager = HealthManager()
    @State private var navigate = false
    
    var body: some View {
        
        ZStack {
            VStack {
                Spacer()
                
                Text("Automatic Setup")
                    .font(.title.bold())
                
                Image(systemName: "applewatch.and.arrow.forward")
                    .font(.largeTitle)
                    .frame(width: 70, height: 70)
                    .background(Color("CardBackground"))
                    .cornerRadius(100)
                    .padding(.vertical, 16)
                
                
                Button {
                    healthManager.requestHealthKitAccess()
                    if healthManager.isAuthorized {
                        navigate = true
                    }
                } label: {
                    HStack {
                        Spacer()
                        if healthManager.isAuthorized {
                            Label("Synced", systemImage: "checkmark.circle.fill")
                                .foregroundStyle(.green)
                        } else {
                            Label("Sync Health Data", systemImage: "heart.text.square.fill")
                                .font(.title3.bold())
                        }
                        Spacer()
                    }
                }
                .disabled(healthManager.isAuthorized)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .fixedSize(horizontal: true, vertical: true)
                .navigationDestination(isPresented: $navigate) {
                    SetupManualView()
                }
                
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

