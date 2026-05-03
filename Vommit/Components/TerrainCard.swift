import SwiftUI

struct TerrainCard: View {
    let terrain: Terrain
    
    var body: some View {
        AsyncImage(url: URL(string: terrain.image))
            .frame(width: 80, height: 80)
            .cornerRadius(6)
        
        Text(terrain.name)
            .font(.system(size: 11))
            .padding(.top, 4)
    }
}

#Preview {
    TerrainCard(terrain: Terrain(
        name: "Rocky Ascent",
        image: "https://dummyimage.com/80"
    ))
}
