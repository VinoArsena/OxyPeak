import SwiftUI

struct TrainingView: View {
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                VStack {
                    // content here
                    
                }
            }
            .preferredColorScheme(.dark)
            .background(Color("Background"))
            
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
        
    }
}

#Preview {
    TrainingView()
        
}
