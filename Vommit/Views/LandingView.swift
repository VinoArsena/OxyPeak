import SwiftUI

struct LandingView: View {
    @Binding var user: User?
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Image
                Image("BGFinalOxy")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    // Logo Vommit (Asset Image)
                    Image("LogoOxy")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160)
                        .offset(x: -8)
                        .padding(.top, 80)
                    
                    Spacer()
                        .frame(height: 12) 

                    // Subtitle "Match Your VO2 Max"
                    Text("**Match Your VO\u{2082} Max** to the Mountain\n and Climb with Confidence")
                        .font(.system(size: 20, weight: .regular))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)

                    Spacer()

                    // Button Get Started
                    NavigationLink(destination: SetupView(user: $user)) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color.blue)
                            .clipShape(Capsule())
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 16)

                    // Footer
                    Text("Based on research from\nAmerican College of Sports Medicine")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 13, weight: .light))
                        .italic()
                        .foregroundColor(.white)
                        .padding(.bottom, 100)
                }
            }
        }
    }
}

#Preview {
    LandingView(user: .constant(nil))
}
