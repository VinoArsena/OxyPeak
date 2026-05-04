import SwiftUI

struct LandingView: View {

    var body: some View {
        NavigationStack {
            ZStack {
                // Background Image
                Image("BGFinalVommit")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    // Logo Vommit (Asset Image)
                    Image("LogoVommit")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 190)
                        .offset(x: -8)
                        .padding(.top, 80)
                    
                    Spacer()
                        .frame(height: 12) 

                    // Subtitle "Check Minimum VO2)
                    Text("Check minimum **VO\u{2082} Max**\nto safely **summit**")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)

                    Spacer()

                    // Action Section
                    NavigationLink(destination: SetupView()) {
                        Text("Get Started")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color.blue)
                            .clipShape(Capsule())
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 16)

                    // Footer (Button Get Started)
                    Text("Based on research from\nAmerican College of Sports Medicine")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 12, weight: .light))
                        .italic()
                        .foregroundColor(.white)
                        .padding(.bottom, 70)
                }
            }
        }
    }
}

#Preview {
    LandingView()
}
