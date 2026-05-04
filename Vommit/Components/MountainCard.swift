import SwiftUI

struct MountainCard: View {
    let mountain: Mountain
    
    func formatNumber(_ number: Double) -> String {
        return number.formatted(.number.precision(.fractionLength(0...2)))
    }
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: mountain.imageUrl))
                .scaledToFit()
                .frame(width: 120, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 26, style: .continuous))
            
            VStack(spacing: 12) {
                HStack {
                    Text("Mount " + mountain.name)
                        .font(.title3.bold())
                    Spacer()
                    Label {
                        Text("Grade \(mountain.grade)")
                            .foregroundStyle(.secondary)
                    } icon: {
                        Image(systemName: "circle.dashed")
                            .imageScale(.small)
                            .bold()
                            .foregroundStyle(mountain.themeColor)
                    }
                }
                
                HStack {
                    Label {
                        Text("\(mountain.elevation) masl")
                            .foregroundStyle(.secondary)
                    } icon: {
                        Image(systemName: "water.waves.and.arrow.trianglehead.up")
                            .imageScale(.small)
                    }
                    Spacer()
                    Label {
                        Text("\(formatNumber(mountain.distance)) km")
                            .foregroundStyle(.secondary)
                    } icon: {
                        Image(systemName: "point.topleft.filled.down.to.point.bottomright.curvepath")
                            .imageScale(.small)
                    }
                }
                
                HStack {
                    Label {
                        Text("\(mountain.estimation.lowerBound)-\(mountain.estimation.upperBound) d")
                            .foregroundStyle(.secondary)
                    } icon: {
                        Image(systemName: "point.topleft.filled.down.to.point.bottomright.curvepath")
                            .imageScale(.small)
                    }
                    Spacer()
                }
            }
            .padding(16)
        }
        .background(Color("CardBackground"))
        .preferredColorScheme(.dark)
        .cornerRadius(26)
        
    }
}

#Preview {
    MountainCard(mountain: Mountain(
        name: "Rinjani",
        imageUrl: "https://d18sx48tl6nre5.cloudfront.net/webp_xl_9a4e03f5b7b3ff53050a863be365b8ff.webp",
        grade: 4,
        duration: 10,
        elevation: 3726,
        distance: 35,
        estimation: 3..<4,
        overview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        vo2max: 15
    ))
}
