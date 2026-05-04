import SwiftUI

struct TrainingView: View {
    let exercises: [ExerciseCard] = [
        ExerciseCard(
            icon: "figure.walk",
            title: "Running",
            description: "Interval or long run indoor or outdoor."),
        ExerciseCard(
            icon: "figure.step.training",
            title: "Step Up",
            description: "Stepping up and down a ledge or stair repeatedly."),
        ExerciseCard(
            icon: "figure.indoor.soccer",
            title: "Any Sports",
            description: "Any sports required intense effort and high heart rate.")
    ]
    
    var body: some View {
    NavigationStack {
            ZStack {
                VStack (alignment: .leading) {
                    VStack (spacing: 16) {
                            Text("Your VO₂ Max")
                                .font(.title3.bold())
                            Text("20.8")
                                .font(.title3.bold())
                            Text("ml/kg/min")
                        }
                    .frame(maxWidth: .infinity)
                    .padding(16)
                    .background(Color("CardBackground"))
                    .cornerRadius(26)
                    .padding(16)
                    
                    HStack(alignment: .center, spacing: 16) {
                        ZStack {
                            Image(systemName: "figure")
                                .font(.system(size: 34))
                                .frame(width: 40, height: 41)
                                .foregroundColor(.white)
                        }
                        .padding(.top, 4)
                    
                        VStack(alignment: .leading, spacing: 6) {
                            Text("What to do ?")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text("Improve VO₂ Max by doing regular exercise to increase endurance.")
                                .font(.subheadline)
                                .foregroundColor(Color.white.opacity(0.7))
                                .lineSpacing(4)
                        }
                    }
                    .padding(.vertical, 24)
                    .padding(.horizontal, 20)
                    .background(Color("CardBackground"))
                    .cornerRadius(26)
                    
                    Text("Recommended Exercise")
                        .font(.system(size: 20, weight: .semibold))
                    
                    
                
                    // content here
                    ForEach(exercises, id: \.title) { exercise in ExerciseCard(
                        icon: exercise.icon,
                        title: exercise.title,
                        description: exercise.description)
                    }
                }
                .padding(.vertical)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .bold))
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Training Plan")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                        Text("Based on your VO₂ Max")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .background(Color("Background"))
    }
    
}


#Preview {
    TrainingView()
    
}
