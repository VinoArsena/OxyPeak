import SwiftUI

struct HomeView: View {
    let mountains: [Mountain] = DatabaseManager.mountains
    @State private var navigate = false
    @Binding var user: User?
    
    var age: Int {
        guard let birthday = user?.dob else { return 0 }
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: Date())
        return ageComponents.year ?? 0
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            // Welcome Text
            VStack(alignment: .leading) {
                Text("Hi, " + (user?.name ?? "User"))
                    .font(.largeTitle)
                    .bold()
                
                Text("Ready to Hike today?")
            }
            
            // Profile Card
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(user?.name ?? "User")
                        .font(.system(size: 20))
                        .bold()
                    
                    Text("Others")
                    Text("\(age) years old")
                    
                    Text("\(String(format: "%.0f", user?.height ?? 170)) cm")
                    Text("\(String(format: "%.0f", user?.weight ?? 70)) kg")
                }
                .padding(16)
                
                Spacer()
                
                Divider()
                    .frame(height: 175)
                
                Spacer()
                
                VStack(spacing: 8) {
                    Text("VO\u{2082} Max")
                        .bold()
                    Text("\(String(format: "%.0f", user?.vo2Max ?? 30))")
                        .font(.system(size: 32))
                        .bold()
                    Text("ml/kg/min")
                    Button {
                        // sync
                    } label: {
                        Text("Update")
                    }
                    .buttonStyle(.glassProminent)
                }
                .padding(36)
            }
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(Color.cardBackground)
            .clipShape(RoundedRectangle(cornerRadius: 26))
            
            // Mountain Cards
            VStack(alignment: .leading, spacing: 12) {
                Text("Pick Mountain")
                    .font(.title.bold())
                
                ForEach(mountains, id: \.id) { mountain in
                    HStack{
                        Button {
                            navigate = true
                        } label: {
                            Image(systemName: "mountain.2")
                            Text("Mt. " + mountain.name)
                        }
                        .buttonStyle(.plain)
                        .navigationDestination(isPresented: $navigate) {
                            MountainDetailView(mountain: mountain, user: $user)
                        }
                        
                        Spacer()
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(Color.cardBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(16)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    HomeView(user: .constant(nil))
}

