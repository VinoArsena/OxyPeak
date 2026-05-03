import SwiftUI

func formatNumber(_ number: Double) -> String {
    return number.formatted(.number.precision(.fractionLength(0...2)))
}

struct MountainDetailView: View {
    let mountain: Mountain
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("Mountain \(mountain.name)")
                    .font(.title.bold())
                
                AsyncImage(url: URL(string: mountain.imageUrl)) { image in
                    image.image?.resizable()
                }
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 240)
                .clipShape(RoundedRectangle(cornerRadius: 26, style: .continuous))
                
                HStack(spacing: 16) {
                    HStack {
                        Image(systemName: "clock")
                            .font(.title3)
                        VStack(alignment: .leading) {
                            Text("Duration")
                                .font(.subheadline)
                            Text("\(mountain.estimation.lowerBound)-\(mountain.estimation.upperBound) d")
                                .font(.headline)
                        }
                    }
                    
                    
                    HStack {
                        Image(systemName: "figure.hiking")
                            .font(.title3)
                        VStack(alignment: .leading) {
                            Text("Elevation")
                                .font(.subheadline)
                            Text("\(mountain.elevation) masl")
                                .font(.headline)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "point.bottomleft.forward.to.point.topright.filled.scurvepath")
                            .font(.title3)
                        VStack(alignment: .leading) {
                            Text("Distance")
                                .font(.subheadline)
                            Text("\(formatNumber(mountain.distance)) km")
                                .font(.headline)
                        }
                    }
                }
                .padding(.vertical, 16)
                
                Divider()
                    .foregroundStyle(.secondary)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Overview")
                            .font(.title3.bold())
                        
                        Text(mountain.overview)
                        
                        Text("Terrain Preview")
                            .font(.title3.bold())
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            // Terrain Images
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                }
                
                Button {
                    
                } label: {
                    Text("Next")
                }
                .buttonStyle(.glass)
                
                
            }
            .padding(24)
            .frame(maxWidth: .infinity)
        }
        .preferredColorScheme(.dark)
        .background(Color("Background"))
        
    }
}

#Preview {
    MountainDetailView(
        mountain: Mountain(
            name: "Rinjani",
            imageUrl: "https://d18sx48tl6nre5.cloudfront.net/webp_xl_9a4e03f5b7b3ff53050a863be365b8ff.webp",
            grade: 4,
            duration: 10,
            elevation: 3726,
            distance: 35,
            estimation: 3..<4,
            overview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            vo2max: 15,
        ))
}

