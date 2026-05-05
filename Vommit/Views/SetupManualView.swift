import SwiftUI

struct SetupManualView: View {
    
    @State private var name: String = ""
    
    enum gender {
        case male, female, others
        var id: Self { self }
    }
    @State private var selectedGender: gender = .others
    
    @State private var birthday: Date = Date()
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var vo2Max: String = ""
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 24) {
                
                VStack(spacing: 8) {
                    Text("Setup Profile").font(.system(size: 34, weight: .bold))
                    Text("Tell us about yourself").foregroundColor(.secondary)
                }
                
                VStack(spacing: 16) {
                    
                    InputRow(label: "Name") {
                        TextField("Joanne Doe", text: $name)
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Gender")
                                .bold()
                            Picker("TEST", selection: $selectedGender) {
                                Text("Male").tag(gender.male)
                                Text("Female").tag(gender.female)
                                Text("Others").tag(gender.others)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack(alignment: .leading) {
                            Text("Date of Birth")
                                .bold()
                            DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                                .labelsHidden()
                                .datePickerStyle(.compact)
                        }
                        .frame(maxWidth: .infinity)
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
                
                Button("Continue") {
                    
                }
                .font(.headline)
                .buttonStyle(.borderless)
                .padding()
                
                Spacer()
            }
            .padding(24)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .preferredColorScheme(.dark)
        .background(Color("Background"))
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
                .padding(.horizontal, 12)
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

