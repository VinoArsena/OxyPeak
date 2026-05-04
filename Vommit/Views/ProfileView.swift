import SwiftUI

struct ProfileView: View {
    let user: User
    let items = ["Age", "Gender", "Height", "Weight", "VO2 Max"]
    //    let update = ["Age", "Gender", "Height", "Weight", "VO2 Max"]
    
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("Profile")
                    .font(.largeTitle.bold())
                
                HStack (spacing: 16){
                    Image(systemName: "person.circle.fill")
                        .font(.largeTitle)
                    
                    VStack(alignment: .leading) {
                        Text("\(user.name)")
                            .font(.headline)
                        Text("Outdoor Enthusiast")
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
                
                
                VStack (alignment: .leading){
                    Text("Update VO₂ Max ")
                        .font(Font.body.bold())
                    Text("Last update: May 1, 2026")
                    Text("Update")
                        .padding(16)
                        .frame(maxWidth: .infinity)
                        .background(Color("CardBackground")) // Pakai warna card kamu
                        .cornerRadius(26)
                        
                    
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

