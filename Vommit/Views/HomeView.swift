import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    @State private var chosenGrade: Int = 0
    @State private var navigationId = UUID()
    
    let mountains: [Mountain] = DatabaseManager.mountains
    let grades = [
        (label: "All", value: 0),
        (label: "Grade 1", value: 1),
        (label: "Grade 2", value: 2),
        (label: "Grade 3", value: 3),
        (label: "Grade 4", value: 4),
        (label: "Grade 5", value: 5)
    ]
    
    var filteredMountains: [Mountain] {
        mountains.filter { mountain in
            let searchTextMatch = searchText.isEmpty || mountain.name.localizedCaseInsensitiveContains(searchText)
            
            let gradeMatch = chosenGrade == 0 || mountain.grade == chosenGrade
            
            return searchTextMatch && gradeMatch
        }
    }
    
    var body: some View {
        TabView {
            ZStack {
                NavigationStack {
                    Picker("Filter Grades", selection: $chosenGrade) {
                        ForEach(grades, id: \.value) { option in
                            Text(option.label).tag(option.value)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                    .background(Color.background)
                    
                    ScrollView {
                        ForEach(filteredMountains, id: \.id) { mountain in
                            NavigationLink {
                                MountainDetailView(mountain: mountain, gradeColorTheme: .orange)
                            } label: {
                                MountainCard(mountain: mountain)
                                    .padding(.bottom, 5)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(16)
                    .navigationTitle("Choose Mountain")
                    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                    .background(Color.background)
                }
                .id(navigationId)
                .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("PopToRoot"))) { _ in
                    navigationId = UUID()
                }
                
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
            }
            .preferredColorScheme(.dark)
            .background(Color("Background"))
            
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            
            ProfileView(
                user: User(
                    name: "Joanne Doe",
                    dob: Date(),
                    gender: .others,
                    height: 170,
                    weight: 60,
                    vo2Max: 30
                ))
            .tabItem {
                Label("Profile", systemImage: "person")
            }
        }
        .background(Color.background)
    }
}

#Preview {
    HomeView()
}

