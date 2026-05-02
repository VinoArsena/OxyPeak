import SwiftUI

struct ProfileView: View {
    let user: User
    let items = ["Apple", "Banana", "Cherry"]
    
    var body: some View {
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
                       Text(item) // This is your row
                   }
            
            Spacer()
        }
        .padding(.horizontal, 24)
        
    }
}

#Preview {
    ProfileView(user: User(
        name: "Joanne Doe",
        dob: Date(),
        gender: .others,
        height: 170,
        weight: 60,
        vo2Max: 30
    ))
        .preferredColorScheme(.dark)
        .background(Color("Background").ignoresSafeArea())
}

