import SwiftUI

struct SetupView: View {
    @State private var healthManager = HealthManager()
    @State private var syncing = false
    @State private var navigateAuto = false
    @State private var navigateManual = false
    
    @Binding var user: User?
    
    var body: some View {
        ZStack {
            VStack {
                Text("Sync Health App")
                    .font(.title.bold())
                
                Spacer()
                
                ZStack {
                    if(healthManager.syncStatus == .syncing) {
                        Circle()
                            .stroke(Color.white.opacity(0.5), lineWidth: 2)
                            .frame(width: 80, height: 80)
                            .scaleEffect(syncing ? 2.5 : 1.0)
                            .opacity(syncing ? 0.0 : 1.0)
                            .animation(
                                .easeOut(duration: 1.5).repeatForever(autoreverses: false),
                                value: syncing
                            )
                            .onAppear { syncing = true }
                    }
                    Image(systemName: "applewatch.radiowaves.left.and.right")
                        .font(.largeTitle)
                        .padding(24)
                }
                
                
                if(healthManager.syncStatus == .syncing) {
                    Text("Syncing")
                        .font(.title3.bold())
                }
                else if(healthManager.syncStatus == .success) {
                    Label("Synced Successfully", systemImage: "checkmark.circle.fill")
                        .font(.title3.bold())
                        .foregroundStyle(.green)
                } else {
                    Label("Sync Failed", systemImage: "x.circle.fill")
                        .font(.title3.bold())
                        .foregroundStyle(.red)
                }
                
                if (healthManager.syncStatus == .failed) {
                    Button {
                        navigateManual = true
                    } label: {
                        HStack(spacing: 16) {
                            Image(systemName: "gearshape.2.fill")
                                .font(.title)
                            Text("Input Data Manually")
                                .bold()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .navigationDestination(isPresented: $navigateManual) {
                        SetupManualView(
                            name: "",
                            selectedGender: Gender(from: healthManager.gender),
                            birthday: healthManager.dob,
                            height: healthManager.height,
                            weight: healthManager.weight,
                            vo2Max: healthManager.vo2Max,
                            user: $user
                        )
                    }
                }
                
                Spacer()
            }
            .padding(24)
            .frame(maxWidth: .infinity)
        }
        .preferredColorScheme(.dark)
        .background(Color("Background"))
        .onAppear {
            syncing = true
            
            Task {
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                await MainActor.run {
                    healthManager.requestHealthKitAccess()
                }
            }
        }
        
    }
    
}

#Preview {
    SetupView(user: .constant(nil))
}
