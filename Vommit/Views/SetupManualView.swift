import SwiftUI

enum gender: String {
    case male = "male"
    case female = "female"
    case others = "others"
}

struct SetupManualView: View {
    @State var name: String
    @State var selectedGender: String = gender.others.rawValue
    @State var birthday: Date
    @State var height: Double?
    @State var weight: Double?
    @State var vo2Max: Double?
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 24) {
                
                VStack(spacing: 8) {
                    Text("Setup Profile")
                        .font(.title.bold())
                    Text("Tell us about yourself")
                        .foregroundColor(.secondary)
                }
                
                VStack(spacing: 16) {
                    
                    InputRow(label: "Name") {
                        TextField("Joanne Doe", text: $name)
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Gender")
                                .bold()
                            Picker("Gender", selection: $selectedGender) {
                                Text("Male").tag(gender.male.rawValue)
                                Text("Female").tag(gender.female.rawValue)
                                Text("Others").tag(gender.others.rawValue)
                            }
                            .pickerStyle(.menu)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading) {
                            Text("Date of Birth")
                                .bold()
                            DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                                .labelsHidden()
                                .datePickerStyle(.compact)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    
                    InputRow(label: "Height") {
                        TextField("175 cm", value: $height, formatter: NumberFormatter())
                    }
                    
                    InputRow(label: "Weight") {
                        TextField("60 kg", value: $weight, formatter: NumberFormatter())
                    }
                    
                    InputRow(label: "VO₂ Max") {
                        TextField("30 ml/kg/min", value: $vo2Max, formatter: NumberFormatter())
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
    SetupManualView(
        name: "Joanne Doe",
        selectedGender: "Male",
        birthday: Date(),
        height: 170.0,
        weight: 60.0,
        vo2Max: 35.0
    )
}

