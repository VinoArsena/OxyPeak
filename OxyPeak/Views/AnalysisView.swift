import SwiftUI

struct AnalysisView: View {
    let mountain: Mountain
    @State private var navigate = false
    @Environment(\.dismiss) var dismiss

    @Binding var user: User?
    let onGoHome: () -> Void
    var gap: Double {
        abs(calculateGap(mountainvo2max: mountain.vo2max, uservo2max: user?.vo2Max ?? 30))
    }
    
    var isAboveTarget: Bool {
        (user?.vo2Max ?? 30) >= mountain.vo2max
    }
    
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
                Image(systemName: "circle.fill")
                    .bold()
                    .foregroundStyle(mountain.themeColor)
                Text("Grade " + String(mountain.grade))
            }
            
            VStack {
                HStack {
                    Text(isAboveTarget ? "\(String(format: "%.0f", gap))" : "-\(String(format: "%.0f", gap))")
                        .font(.system(size: 80))
                        .bold()
                        .foregroundStyle(isAboveTarget ? .green : .red)
                    Text("ml/kg/min")
                }
                
                Text(isAboveTarget ? "You are above the target" : "You are below the target")
                    .font(.headline)
                    .foregroundStyle(isAboveTarget ? .green : .red)
            }
            
            HStack(spacing: 8) {
                VStack(spacing: 5) {
                    Text("You")
                        .bold()
                    Text("\(String(format: "%.0f", user?.vo2Max ?? 30))")
                        .font(.title)
                        .bold()
                    Text("ml/kg/min")
                }
                .padding(24)
                .frame(maxWidth: .infinity)
                .background(Color.cardBackground)
                .clipShape(RoundedRectangle(cornerRadius: 26))
                
                Spacer()
                
                VStack(spacing: 5) {
                    Text("Mountain")
                        .bold()
                    Text("\(String(format: "%.0f", mountain.vo2max))")
                        .font(.title)
                        .bold()
                    Text("ml/kg/min")
                }
                .padding(24)
                .frame(maxWidth: .infinity)
                .background(Color.cardBackground)
                .clipShape(RoundedRectangle(cornerRadius: 26))
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
                RecommendationView(user: $user, onGoHome: onGoHome)
            }
            
            VStack {
                HStack {
                    Image(systemName: "book.pages")
                    Text("The Science Behind")
                        .font(.callout)
                        .bold()
                }
                .padding(.bottom, 4)
                
                Text("Using your route gradient and ascent window, we’ve calculated the minimum VO₂ Max required to complete your summit safely.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 52)
            }
            
            Spacer()
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarBackButtonHidden()
        .preferredColorScheme(.dark)
        .background(Color("Background"))
    }
}

#Preview {
    AnalysisView(mountain: Mountain(
        name: "Rinjani",
        imageUrl: "https://d18sx48tl6nre5.cloudfront.net/webp_xl_9a4e03f5b7b3ff53050a863be365b8ff.webp",
        grade: 4,
        duration: 20,
        elevation: 3726,
        distance: 25,
        estimation: 3..<4,
        overview: "Active volcano in Lombok with challenging terrain and stunning crater views, routes range from easiest via Senaru, via Torean, to most demanding via Sembalun, with oxygen levels decreasing significantly above 2,500 meters."
    ),
        user: .constant(nil),
        onGoHome: {}
    )
}
