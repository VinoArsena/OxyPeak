import SwiftUI

struct SetupAutoView: View {
    @State private var healthManager = HealthManager()
    @State private var navigate = false
    @State private var showNext = false
    
    @Binding var user: User?
    
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
                .onChange(of: healthManager.isAuthorized) {
                    Task {
                        try? await Task.sleep(nanoseconds: 1_500_000_000)
                        
                        await MainActor.run {
                            navigate = true
                        }
                    }
                }
                .navigationDestination(isPresented: $navigate) {
                    SetupManualView(name: "", selectedGender: Gender(from: healthManager.gender), birthday: healthManager.dob, height: healthManager.height, weight: healthManager.weight, vo2Max: healthManager.vo2Max, user: $user)
                }
                
                if(healthManager.isAuthorized) {
                    Button {
                        showNext = true
                    } label: {
                        Text("Next")
                    }
                    .navigationDestination(isPresented: $showNext) {
                        SetupManualView(name: "", selectedGender: Gender(from: healthManager.gender), birthday: healthManager.dob, height: healthManager.height, weight: healthManager.weight, vo2Max: healthManager.vo2Max, user: $user)
                    }
                    .padding()
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
    SetupAutoView(user: .constant(nil))
}

