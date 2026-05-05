import Foundation

struct DatabaseManager {
    static let mountains: [Mountain] = [
        Mountain(
            name: "Rinjani",
            imageUrl: "https://res.cloudinary.com/dxcn5osfu/image/upload/v1777948670/Mt._Rinjani_hybbmc.png",
            grade: 4,
            duration: 72,
            elevation: 3726,
            distance: 28,
            estimation: 3..<4,
            overview: "A majestic active volcano in Lombok, offering a challenging multi-day trek with a stunning crater lake, Segara Anak.",
            vo2max: 45
        ),
        Mountain(
            name: "Kerinci",
            imageUrl: "https://res.cloudinary.com/dxcn5osfu/image/upload/v1777948670/MT._Kerinci_d6z01w.jpg",
            grade: 1,
            duration: 2,
            elevation: 2329,
            distance: 5,
            estimation: 1..<2,
            overview: "An iconic volcanic plateau in East Java. Accessible and famous for its ethereal sunrise and desert-like sea of sand.",
            vo2max: 25
        ),
        Mountain(
            name: "Binaiya",
            imageUrl: "https://res.cloudinary.com/dxcn5osfu/image/upload/v1777948670/MT._Binaiya_lkpkwa.jpg",
            grade: 2,
            duration: 8,
            elevation: 2565,
            distance: 7,
            estimation: 2..<3,
            overview: "Located in the Dieng Plateau, known for the 'Golden Sunrise' and a relatively gentle incline suitable for beginners.",
            vo2max: 35
        ),
        Mountain(
            name: "Argopuro",
            imageUrl: "https://res.cloudinary.com/dxcn5osfu/image/upload/v1777948670/MT._Argopuro_qe5rbe.jpg",
            grade: 5,
            duration: 168,
            elevation: 4884,
            distance: 60,
            estimation: 5..<6,
            overview: "The highest peak in Oceania. A technical limestone climb requiring rock climbing skills and high-altitude endurance.",
            vo2max: 55
        ),
        Mountain(
            name: "Papandayan",
            imageUrl: "https://res.cloudinary.com/dxcn5osfu/image/upload/v1777948970/Gunung_Papandayan_qu4i5x.jpg",
            grade: 3,
            duration: 12,
            elevation: 2665,
            distance: 12,
            estimation: 2..<3,
            overview: "A popular crater trek in West Java featuring sulfur vents, 'dead forests', and beautiful edelweiss fields.",
            vo2max: 40
        )
    ]
    
    static let terrains: [Terrain] = [
        Terrain(name: "Rumput",
                image: "https://res.cloudinary.com/dxcn5osfu/image/upload/v1777948671/Terrain_Rumput_crdza6.jpg"
               ),
        Terrain(name: "Curam",
                image: "https://res.cloudinary.com/dxcn5osfu/image/upload/v1777948670/Terrain_Preview_i3ohgn.jpg"
               ),
        Terrain(name: "Pasir",
                image: "https://res.cloudinary.com/dxcn5osfu/image/upload/v1777948669/Terrain_Pasir_ebej4e.jpg"
               ),
        Terrain(name: "Bebatuan",
                image: "https://res.cloudinary.com/dxcn5osfu/image/upload/v1777948669/Terrain_Bebatuan_sbbyfq.jpg"
               ),
    ]
    
    static var mockMountains: [String] = [
        "https://res.cloudinary.com/dxcn5osfu/image/upload/v1777948677/MountainDetailView_Mt._Rinjani_Main1_yizfil.png",
        "https://res.cloudinary.com/dxcn5osfu/image/upload/v1777948669/MountainDetailView_Main2_kwfwse.jpg",
        "https://res.cloudinary.com/dxcn5osfu/image/upload/v1777948669/Mountain_Detail_View_Main3_ygwioo.jpg"
    ]
    
    static let exerciseRecommendations: [Exercise] = [
        Exercise(
            imageSystem: "figure.run",
            exerciseName: "Running",
            exerciseDesc: "Interval or long run indoor or outdoor"
        ),
        Exercise(
            imageSystem: "figure.step.training",
            exerciseName: "Step Up",
            exerciseDesc: "Stepping up and down a ledge or stair repeatedly"
        ),
        Exercise(
            imageSystem: "figure.indoor.soccer",
            exerciseName: "Any Sports",
            exerciseDesc: "Any sports required intense effort and high heart rate"
        ),
    ]
}
