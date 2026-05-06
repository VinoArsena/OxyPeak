import SwiftUI

struct SetupManualView: View {
    @State var name: String = ""
    @State var selectedGender: Gender
    @State var birthday: Date
    @State var height: Double
    @State var weight: Double
    @State var vo2Max: Double
    @State private var navigate: Bool = false
    
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
                                Text("Select..").tag(Gender.notset)
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
                        TextField("", value: $height, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                    
                    InputRow(label: "Weight") {
                        TextField("", value: $weight, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                    
                    InputRow(label: "VO₂ Max") {
                        TextField("", value: $vo2Max, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                }
                .padding(.bottom, 8)
                
                Button {
                    user = User(
                        name: name,
                        dob: birthday,
                        gender: selectedGender,
                        height: height,
                        weight: weight,
                        vo2Max: vo2Max
                    )
                    navigate = true
                } label: {
                    Text("Continue")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.glassProminent)
                .disabled(name.isEmpty || height == 0 || weight == 0 || vo2Max == 0)
                .navigationDestination(isPresented: $navigate) {
                    HomeView(user: $user)
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
        name: "", selectedGender: .female, birthday: Date(), height: 0, weight: 0, vo2Max: 0, user: .constant(nil)
    )
}
