import SwiftUI

struct TrainingView: View {
    @Environment(\.dismiss) var dismiss
    @State private var navigate = false
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    TrainingHeader(dismiss: dismiss)
                    CalculationSummaryCard()
                    RecommendedExerciseSection()
                }
            }
        }
        .preferredColorScheme(.dark)
        .navigationBarHidden(true)
    }
}

// MARK: - Subviews

struct TrainingHeader: View {
    var dismiss: DismissAction
    
    var body: some View {
        HStack {
            Button(action: { dismiss() }) {
                Image(systemName: "chevron.left")
                    .font(.title3.bold())
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                    .background(Circle().fill(Color.blue))
            }
            .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                Text("Training")
                    .font(.title2.bold())
                    .foregroundColor(.white)
                Text("Based on your VO₂ Max")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }
}

struct CalculationSummaryCard: View {
    var body: some View {
        VStack(spacing: 0) {
            // Metric Section
            VStack(spacing: 8) {
                Text("Your VO₂ Max")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("20.8")
                    .font(.system(size: 34, weight: .bold))
                Text("ml/kg/min")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            
            Divider()
                .background(Color.white.opacity(0.1))
                .padding(.horizontal)

            // Advice Section
            HStack(alignment: .top, spacing: 16) {
                Image(systemName: "figure")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .frame(width: 44)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("What to do?")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("Improve VO₂ Max by doing regular exercise to increase endurance.")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding(20)
        }
        .background(Color("CardBackground"))
        .cornerRadius(24)
        .padding(.horizontal)
        .padding(.vertical, 16)
    }
}

struct RecommendedExerciseSection: View {
    let exercises: [Exercise] = [
        Exercise(icon: "figure.walk", title: "Running", desc: "Interval or long run indoor or outdoor."),
        Exercise(icon: "figure.step.training", title: "Step Up", desc: "Stepping up and down a ledge or stair repeatedly."),
        Exercise(icon: "figure.indoor.soccer", title: "Any Sports", desc: "Any sports required intense effort and high heart rate.")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Recommended Exercise")
                .font(.system(size: 20, weight: .semibold))
                .padding(.horizontal)

            ForEach(exercises, id: \.title) { item in
                HStack(spacing: 16) {
                    Image(systemName: item.icon)
                        .font(.title2)
                        .frame(width: 40)
                    VStack(alignment: .leading) {
                        Text(item.title).font(.headline)
                        Text(item.desc).font(.subheadline).foregroundColor(.secondary)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("CardBackground"))
                .cornerRadius(16)
                .padding(.horizontal)
            }
            
            Button(action: {
                NotificationCenter.default.post(name: NSNotification.Name("PopToRoot"), object: nil)
            }) {
                Text("Find Another Mountain")
                    .font(.title3.bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(16)
                    .background(Color.blue)
                    .cornerRadius(30)
            }
            .padding(.horizontal)
            .padding(.top, 12)
        }
    }
}

// Helper model
struct Exercise {
    let icon: String
    let title: String
    let desc: String
}

// MARK: - Preview
#Preview {
    TrainingView()
}
