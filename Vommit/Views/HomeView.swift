import SwiftUI

struct HomeView: View {
    let mountains: [Mountain] = DatabaseManager.mountains
    @State private var navigate = false
    
    var body: some View {
        VStack(alignment: .leading) {
            // Welcome Text
            VStack(alignment: .leading) {
                Text("Hi Adri")
                    .font(.largeTitle)
                    .bold()
                
                Text("Ready to Hike today?")
            }
            
            // Profile Card
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Joanne Doe")
                        .font(.system(size: 20))
                        .bold()
                    Text("Others")
                    Text("18 years old")
                    Text("170 cm")
                    Text("60 kg")
                }
                .padding(.leading, 25)
                
                Spacer()
                
                Divider()
                    .frame(height: 175)
                
                Spacer()
                
                VStack(spacing: 8) {
                    Text("VO\u{2082} Max")
                        .bold()
                    Text("20.8")
                        .font(.system(size: 32))
                        .bold()
                    Text("ml/kg/min")
                    Button {
                        // sync
                    } label: {
                        Text("Update")
                    }
                    .buttonStyle(.glass)
                }
                .padding(.trailing, 35)
            }
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(Color.cardBackground)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            // Mountain Cards
            VStack(alignment: .leading) {
                Text("Pick Mountain")
                    .font(.largeTitle)
                    .bold()
                
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
//                            MountainDetailView(mountain: mountain)
                        }
                        
                        Spacer()
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(Color.cardBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
        }
        .padding(16)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    HomeView()
}

