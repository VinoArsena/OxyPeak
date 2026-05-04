import SwiftUI

struct ExerciseCard: View {
    var icon: String
    var title: String
    var description: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            
            // LEFT: ICON
            Image(systemName: icon)
                .font(.system(size: 34))
                .frame(width: 40, height: 41)
                .foregroundColor(.white)
            
            // RIGHT: TEXT
            VStack(alignment: .leading, spacing: 4) {
                
                // TITLE
                Text(title)
                    .font(.system(size: 17, weight: .semibold))
                    .lineSpacing(0)
                
                // DESCRIPTION
                Text(description)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.gray)
                    .lineSpacing(0)
            }
            
            Spacer()
        }
        .padding(16)
        .background(Color("CardBackground"))
        .cornerRadius(26)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ExerciseCard(
        icon: "figure.walk",
        title: "Running",
        description: "Interval or long run indoor or outdoor.")
    //    ExerciseCard(
    //        icon: "figure.step.training",
    //        title: "Step Up",
    //        description: "Stepping up and down a ledge or stair repeatedly.",
    //    ExerciseCard(
    //        icon: "figure.indoor.soccer",
    //        title: "Any Sports",
    //        description: "Any sports required intense effort and high heart rate.",
    //            )
    //        .padding()
}
