import SwiftUI

struct HomeView: View {
    //    let mountains: [Mountain] = Mountain.sampleData
    
    var body: some View {
        
        TabView {
            ZStack {
                VStack {
                    
                    Text("Choose Mountain")
                        .font(.title.bold())
                    
                    ScrollView {
                        
                    }
                    
                    Spacer()
                    
                }
                .padding(24)
                
                
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
            }
            .preferredColorScheme(.dark)
            .background(Color("Background"))
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            
            ProfileView(
                user: User(
                    name: "Joanne Doe",
                    dob: Date(),
                    gender: .others,
                    height: 170,
                    weight: 60,
                    vo2Max: 30
                ))
            .tabItem {
                Label("Profile", systemImage: "person")
            }
        }
        
        
        
    }
    
}


#Preview {
    HomeView()
}

