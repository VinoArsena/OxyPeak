import SwiftUI

struct HealthSyncTestView: View {
    @State private var healthManager = HealthManager()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Button(action: {
                        healthManager.requestHealthKitAccess()
                    }) {
                        HStack {
                            Spacer()
                            if healthManager.isAuthorized {
                                Label("Synced", systemImage: "checkmark.circle.fill")
                                    .foregroundStyle(.green)
                            } else {
                                Label("Sync Health Data", systemImage: "heart.text.square.fill")
                            }
                            Spacer()
                        }
                    }
                    .disabled(healthManager.isAuthorized)
                }
                
                Section("VO2 Max") {
                    TextField("VO2 Max", value: $healthManager.vo2Max, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                Section("Body Measurements") {
                    TextField("Weight (kg)", value: $healthManager.weight, format: .number)
                        .keyboardType(.decimalPad)
                    TextField("Height (kg)", value: $healthManager.height, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                Section("Personal Info") {
                    TextField("Gender", text: $healthManager.gender)
                    DatePicker("Date of Birth", selection: $healthManager.dob, displayedComponents: .date)
                }
            }
            .navigationTitle("Health Sync Test")
        }
    }
}

#Preview {
    HealthSyncTestView()
}
