//
//  StatsCard.swift
//  Vommit
//
//  Created by Christopher Hardy Gunawan on 05/05/26.
//
import SwiftUI

struct StatsCard: View {
    let mountain: Mountain
    
    private func formatNumber(_ number: Double) -> String {
        return number.formatted(.number.precision(.fractionLength(0...2)))
    }
    
    var body: some View {
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
    }
}

#Preview {
    StatsCard(mountain: Mountain(
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
    .preferredColorScheme(.dark)
}
