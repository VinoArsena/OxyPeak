import SwiftUI

struct LandingView: View {
    @State private var navigate = false
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
                    Button {
                        navigate = true
                    } label: {
                        Text("Get Started")
                            .padding(8)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.glassProminent)
                    .padding(.horizontal, 85)
                    .padding(.vertical, 15)
                    .navigationDestination(isPresented: $navigate){
                        SetupView(user: $user)
                    }
                    
                    

                    // Footer
                    Text("Based on research from\nAmerican College of Sports Medicine")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(.white)
                        .padding(.bottom, 60)
                }
            }
        }
    }
}

#Preview {
    LandingView(user: .constant(nil))
}
