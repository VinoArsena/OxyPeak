import SwiftUI

struct MountainDetailView: View {
    let mountain: Mountain
    @State private var navigate = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .glassEffect()
                }
                Text("Mt. " + mountain.name)
                    .font(.largeTitle)
                    .bold()
                Spacer()
                Text("Grade " + String(mountain.grade))
            }
            
            VStack {
                HStack {
                    Text("-10")
                        .font(.system(size: 80))
                        .bold()
                        .foregroundStyle(.red)
                    Text("ml/kg/min")
                }
                
                Text("You are below the target")
                    .foregroundStyle(.red)
            }
            
            HStack {
                VStack(spacing: 5) {
                    Text("You")
                        .bold()
                    Text("20.8")
                        .font(.title)
                        .bold()
                    Text("ml/kg/min")
                }
                .padding(50)
                .background(Color.cardBackground)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                
                VStack(spacing: 5) {
                    Text("Mountain")
                        .bold()
                    Text("30.8")
                        .font(.title)
                        .bold()
                    Text("ml/kg/min")
                }
                .padding(50)
                .background(Color.cardBackground)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .frame(maxWidth: .infinity)
            
            StatsCard(mountain: mountain)
            
            Button {
                navigate = true
            } label: {
                Text("See Recommendation")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.glassProminent)
            .navigationDestination(isPresented: $navigate) {
                RecommendationView()
            }
            
            VStack {
                HStack {
                    Image(systemName: "book.pages")
                    Text("The Science Behind")
                        .font(.caption)
                        .bold()
                }
                .padding(.bottom, 4)
                
                Text("Using your route gradient and ascent window, we’ve calculated the minimum engine size (VO₂ Max) required to complete your summit safely.")
                    .font(.caption2)
                    .fontWeight(.thin)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 60)
            }
            
            Spacer()
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarBackButtonHidden()
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MountainDetailView(mountain: Mountain(
        name: "Rinjani",
        imageUrl: "https://d18sx48tl6nre5.cloudfront.net/webp_xl_9a4e03f5b7b3ff53050a863be365b8ff.webp",
        grade: 4,
        duration: 10,
        elevation: 3726,
        distance: 25,
        estimation: 3..<4,
        overview: "Active volcano in Lombok with challenging terrain and stunning crater views, routes range from easiest via Senaru, via Torean, to most demanding via Sembalun, with oxygen levels decreasing significantly above 2,500 meters.",
        vo2max: 15
    ))
}
