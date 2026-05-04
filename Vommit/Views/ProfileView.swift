import SwiftUI

struct ProfileView: View {
    let user: User
    let items = ["Age", "Gender", "Height", "Weight", "VO2 Max"]
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("Profile")
                    .font(.largeTitle.bold())
                
                HStack (spacing: 16){
                    Image(systemName: "person.circle.fill")
                        .font(.largeTitle)
                    
                    VStack {
                        Text("\(user.name)")
                            .font(.headline)
                        Text("Placeholder")
                            .font(.body)
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(16)
                .background(.cardBackground)
                .cornerRadius(26)
                
                List(items, id: \.self) { item in
                    Text(item) // Row
                }
                
                
                Spacer()
            }
            .padding(24)
        }
        .preferredColorScheme(.dark)
        .background(Color("Background"))
        
    }
}

#Preview {
    ProfileView(user: User(
        name: "AnneMary",
        dob: Date(),
        gender: .others,
        height: 170,
        weight: 60,
        vo2Max: 30
    ))
}

