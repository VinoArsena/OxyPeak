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
                VStack {
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
