import SwiftUI

func updateTimestamp() {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium // Contoh: May 4, 2026
    formatter.timeStyle = .short  // Contoh: 9:41 AM


}

struct ProfileView: View {
    let user: User
    let items = ["Age", "Gender", "Height", "Weight", "VO2 Max"]
    @State private var lastUpdateDate: String = "May 1, 2026"
    
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
                
                Section {
                    TextField("Test", text: .constant(""))
                        
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Update VO₂ Max")
                        .font(.body.bold())
                    
                    // Teks ini sekarang mengambil data dari variable lastUpdateDate
                    Text("Last update: \(lastUpdateDate)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Button(action: {
                        // Logika ketika tombol ditekan
                        updateTimestamp()
                    }) {
                        Text("Update")
                            .foregroundColor(.white) // Warna teks tombol
                            .padding(16)
                            .frame(maxWidth: .infinity)
                            .background(Color("CardBackground"))
                            .cornerRadius(26)
                    }
                }
                
                Spacer()
            }
            .padding(24)
        }
        .preferredColorScheme(.dark)
        .background(Color("Background"))
        
        
        //                VStack (alignment: .leading){
        //                    Text("Update VO₂ Max ")
        //                        .font(Font.body.bold())
        //                    Text("Last update: May 1, 2026")
        //                    Text("Update")
        //                        .padding(16)
        //                        .frame(maxWidth: .infinity)
        //                        .background(Color("CardBackground")) // Pakai warna card kamu
        //                        .cornerRadius(26)
        
        
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

