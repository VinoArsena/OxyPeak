import SwiftUI

struct SetupManualView: View {
    @State var name: String
    @State var selectedGender: Gender = .others
    @State var birthday: Date
    @State var height: Double? = nil
    @State var weight: Double? = nil
    @State var vo2Max: Double? = nil
    @State var navigate = false
    
    @Binding var user: User?
    
    
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
                                Text("Male").tag(Gender.male)
                                Text("Female").tag(Gender.female)
                                Text("Others").tag(Gender.others)
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
                    if let h = height, let w = weight, let v = vo2Max {
                        user = User(
                            name: name,
                            dob: birthday,
                            gender: selectedGender,
                            height: h,
                            weight: w,
                            vo2Max: v
                        )
                        navigate = true
                    }
                    navigate = true
                }
                .font(.headline)
                .buttonStyle(.borderless)
                .padding()
                .disabled(name.isEmpty || height == 0 || weight == 0 || vo2Max == 0)
                .navigationDestination(isPresented: $navigate) {
                    HomeView()
                }
                
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
        selectedGender: Gender.male,
        birthday: Date(),
        height: 170.0,
        weight: 60.0,
        vo2Max: 35.0,
        user: .constant(nil)
    )
}

