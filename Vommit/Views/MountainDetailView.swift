import SwiftUI

struct MountainDetailView: View {
    @Environment(\.dismiss) var dismiss
    let mountain: Mountain
    let gradeColorTheme: Color

    func fetchTerrains(for id: UUID) -> [Terrain] {
        return [
            Terrain(id: UUID(), name: "Rocky Ascent", image: "https://dummyimage.com/150"),
            Terrain(id: UUID(), name: "Rocky Ascent", image: "https://dummyimage.com/150"),
            Terrain(id: UUID(), name: "Rocky Ascent", image: "https://dummyimage.com/150"),
            Terrain(id: UUID(), name: "Rocky Ascent", image: "https://dummyimage.com/150")
        ]
    }
    
    func formatNumber(_ number: Double) -> String {
        return number.formatted(.number.precision(.fractionLength(0...2)))
    }
    
    var mockMountainImages: [String] {
        return [
            mountain.imageUrl,
            "https://dummyimage.com/600x400",
            "https://dummyimage.com/600x400"
        ]
    }
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    // Top Navigation
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title3.bold())
                                .foregroundColor(.white)
                                .frame(width: 44, height: 44)
                                .background(Circle().fill(Color.blue))
                        }
                        
                        Text("Mt. \(mountain.name)")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                            .padding(.leading, 8)
                        
                        Spacer()
                        
                        HStack(spacing: 6) {
                            Circle()
                                .fill(gradeColorTheme)
                                .frame(width: 8, height: 8)
                            Text("Grade \(mountain.grade)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                    
                    // Tampilan Gambar di Atas (Utama)
                    TabView {
                        ForEach(mockMountainImages, id: \.self) { imageUrl in
                            AsyncImage(url: URL(string: imageUrl)) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } else {
                                    Color("CardBackground")
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 250)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 24))
                            .padding(.horizontal)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(height: 250)
                    .padding(.top, 16)
                    
                    // Stats
                    HStack(spacing: 0) {
                        // Duration
                        HStack {
                            Image(systemName: "clock")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Duration")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                Text("\(mountain.estimation.lowerBound) - \(mountain.estimation.upperBound) d")
                                    .font(.subheadline.bold())
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        // Elevation
                        HStack {
                            Image(systemName: "figure.walk")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Elevation")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                Text("\(formatNumber(Double(mountain.elevation))) masl")
                                    .font(.subheadline.bold())
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        // Distance
                        HStack {
                            Image(systemName: "point.topleft.filled.down.to.point.bottomright.curvepath")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Distance")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                Text("\(formatNumber(mountain.distance)) km")
                                    .font(.subheadline.bold())
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding(.horizontal)
                    .padding(.top, 16)
                    
                    Divider()
                        .background(Color.white.opacity(0.3))
                        .padding(.horizontal)
                        .padding(.vertical, 12)
                    
                    // Overview
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Overview")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                        
                        Text(mountain.overview)
                            .font(.subheadline)
                            .foregroundColor(Color.white.opacity(0.8))
                            .lineSpacing(2)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    // Terrain Preview
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Terrain Preview")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(fetchTerrains(for: mountain.id), id: \.id) { terrain in
                                    TerrainCard(terrain: terrain)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top, 16)
                    Spacer().frame(height: 30)
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack {
                    Button(action: {
                        // Action for calculating VO2 Max
                    }) {
                        Text("Calculate VO₂ Max")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(16)
                            .background(Color.blue)
                            .cornerRadius(30)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)
                .padding(.bottom, 8)
                .background(Color("Background"))
            }
        }
        .navigationBarHidden(true)
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
    ), gradeColorTheme: .orange)
        .preferredColorScheme(.dark)
}

