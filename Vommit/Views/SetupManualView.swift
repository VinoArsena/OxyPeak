import SwiftUI

struct SetupManualView: View {
    // MARK: - State Variables
    @State private var name: String = ""
    @State private var gender: String = ""
    
    // Using the Date type specifically for the birthday
    @State private var birthday: Date = Date()
    
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var vo2Max: String = ""
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 8) {
                    Text("Setup Profile").font(.system(size: 34, weight: .bold))
                    Text("Tell us about yourself").foregroundColor(.secondary)
                }
                .padding(.top, 20)
                
                    VStack(spacing: 20) {
                        
                        InputRow(label: "Name") {
                            TextField("Fill with your name", text: $name)
                        }
                        
                        HStack(spacing: 15) {
                            InputRow(label: "Gender") {
                                TextField("Select..", text: $gender)
                            }
                            
                            // Birthday now uses a DatePicker instead of a TextField
                            InputRow(label: "Birthday") {
                                DatePicker("", selection: $birthday, displayedComponents: .date)
                                    .labelsHidden()
                                    .datePickerStyle(.compact)
                                    .colorScheme(.dark) // Keeps the text white on dark background
                            }
                        }
                        
                        InputRow(label: "Height") {
                            TextField("175 cm", text: $height)
                        }
                        
                        InputRow(label: "Weight") {
                            TextField("60 kg", text: $weight)
                        }
                        
                        InputRow(label: "VO₂ Max") {
                            TextField("30 ml/kg/min", text: $vo2Max)
                        }
                    }
                
                Button("Continue") { /* Action here */ }
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding()
            }
            .padding(24)
        }
        .preferredColorScheme(.dark)
    }
}

// MARK: - Reusable Row
struct InputRow<Content: View>: View {
    let label: String
    let content: Content
    
    init(label: String, @ViewBuilder content: () -> Content) {
        self.label = label
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label).font(.headline).foregroundColor(.white)
            
            content
                .padding(.horizontal, 12) // Slightly tighter for the DatePicker
                .frame(height: 54)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white.opacity(0.1))
                .cornerRadius(20)
        }
    }
}

#Preview {
    SetupManualView()
}

