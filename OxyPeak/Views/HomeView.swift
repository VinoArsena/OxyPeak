import SwiftUI

struct HomeView: View {
    let mountains: [Mountain] = DatabaseManager.mountains
    @State private var selectedMountain: Mountain?
    @Binding var user: User?
    
    @State private var homeViewModel: HomeViewModel = HomeViewModel()
    @State private var isShowingModal = false
    
    var age: Int {
        guard let birthday = user?.dob else { return 0 }
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: Date())
        return ageComponents.year ?? 0
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                // Welcome Text
                VStack(alignment: .leading) {
                    Text("Hi, " + (user?.name ?? "User"))
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Ready to check?")
                }
                
                // Profile Card
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Others")
                        Text("\(age) years old")
                        
                        Text("\(String(format: "%.0f", user?.height ?? 170)) cm")
                        Text("\(String(format: "%.0f", user?.weight ?? 70)) kg")
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    Divider()
                        .frame(height: 120)
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                    VStack(spacing: 8) {
                        Text("VO\u{2082} Max")
                            .bold()
                        Text("\(String(format: "%.0f", user?.vo2Max ?? 30))")
                            .font(.system(size: 32))
                            .bold()
                        Text("ml/kg/min")
                        Button {
                            withAnimation(.spring()) {
                                isShowingModal.toggle()
                            }
                        } label: {
                            Text("Update")
                        }
                        .buttonStyle(.glassProminent)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(24)
                .background(Color.cardBackground)
                .clipShape(RoundedRectangle(cornerRadius: 26))
                
                // Mountain Cards
                VStack(alignment: .leading, spacing: 16) {
                    Text("Pick Mountain")
                        .font(.title.bold())
                    
                    ForEach(mountains) { mountain in
                        HStack {
                            Button {
                                selectedMountain = mountain
                            } label: {
                                Image(systemName: "mountain.2")
                                Text("Mt. " + mountain.name)
                                Spacer()
                                Image(systemName: "circle.fill")
                                    .foregroundStyle(mountain.themeColor)
                                Text("Grade " + String(mountain.grade))
                            }
                            .buttonStyle(.plain)
                            
                            Spacer()
                        }
                        .padding(16)
                        .frame(maxWidth: .infinity)
                        .background(Color.cardBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 22))
                    }
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(16)
            .blur(radius: isShowingModal ? 4 : 0)
            .preferredColorScheme(.dark)
            .navigationDestination(item: $selectedMountain) { mountain in
                AnalysisView(mountain: mountain, user: $user) {
                    selectedMountain = nil
                }
            }
            
            if isShowingModal {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation { isShowingModal = false }
                    }
                
                UpdateVO2MaxView()
                    .clipShape(RoundedRectangle(cornerRadius: 26))
                    .shadow(radius: 20)
                    .zIndex(1)
            }
        }
    }
}

#Preview {
    HomeView(user: .constant(nil))
}

