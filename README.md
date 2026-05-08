# OxyPeak 🏔️
**Objective Mountain Readiness & Gap Analysis via HealthKit**

OxyPeak is a native iOS application designed to replace subjective mountain preparation with hard, biometric data. By bridging the gap between a user's current cardiovascular capacity and the objective physical demands of specific mountain terrains, OxyPeak provides a definitive, data-backed assessment of whether a user is physiologically prepared for a summit.

## ⚠️ The Problem We Solve
Most hiking applications focus on navigation or generic fitness. They fail to address the critical safety gap in scrambling and alpinism: **subjective overconfidence**. Users cannot accurately self-report their readiness for high-altitude, sustained cardiovascular exertion. OxyPeak removes human bias by utilizing Apple's HealthKit to pull objective VO2 Max data, comparing it directly against established baseline requirements for specific mountains.

## ✨ Key Features
* **Biometric Authority (HealthKit Integration):** Seamlessly syncs with Apple Health to pull verified historical VO2 Max data, eliminating the flaw of user self-reporting.
* **Objective Gap Analysis:** Calculates the exact physiological deficit between the user's current engine (VO2 Max) and the mountain's target requirements. 
* **Dynamic Mountain Database:** Browse graded mountains (e.g., Mt. Rinjani, Mt. Kerinci) complete with elevation profiles, duration estimates, and specific terrain overviews.
* **Actionable Training Plans:** If a deficit is detected, the app generates targeted protocols (interval running, weighted step-ups) to build the required aerobic base.
* **Dark-Mode Optimized UI:** Built with a modern, high-contrast aesthetic utilizing bento-box layouts for immediate data legibility in outdoor environments.

## 🛠 Tech Stack
* **Framework:** SwiftUI (iOS 26+)
* **Architecture:** MVVM (Model-View-ViewModel)
* **Core Libraries:** 
  * `HealthKit` (Biometric data extraction)
  * `Foundation`
* **Design System:** Custom Dark Theme
  * Primary: `#007AFF` (Blue)
  * Secondary: `#30D5C8` (Teal)
  * Tertiary: `#FF3B30` (Red - used for critical gap alerts)
  * Background: `#121212` (Neutral Dark)

## 🗂 Project Structure
The application is structured to strictly separate biometric data processing from UI rendering.

```text
├── Models/
│   ├── User.swift         # UUID, name, dob, gender, height, weight, vo2Max
│   ├── Mountain.swift     # UUID, grade, name, duration, elevation, distance, targetVo2Max
│   └── Terrain.swift      # UUID, mountainId (Foreign Key), name, image URL
├── Views/
│   ├── LandingView.swift
│   ├── SetupView.swift
│   ├── SetupManualView.swift
│   └── SetupAutoView.swift (HealthKit Sync)
│   ├── HomeView.swift
│   ├── MountainDetailView.swift
│   ├── AnalysisView.swift
│   ├── TrainingView.swift
│   └── ProfileView.swift
├── Components/
│   ├── MountainCard.swift
│   ├── TerrainCard.swift
│   └── ExerciseCard.swift
└── Services/
    ├── HealthManager.swift    # Core engine for Apple Health authorization & data fetching
    └── DatabaseManager.swift  # Local/Remote data handling for mountain statistics
```

## 📊 Data Models & ERD
The data relationship is kept lightweight, focusing on a one-to-many relationship between a `Mountain` and its specific `Terrain` challenges.

* **User**: Acts as the dynamic baseline.
* **Mountain**: Acts as the static target requirement.
* **Terrain**: Provides granular context (e.g., scree, forest, rock) mapped to `Mountain` via `mountainId`.

## 🚀 Getting Started

### Prerequisites
* Xcode 26.0 or later
* iOS 26.0+ Simulator or Physical Device (Physical Apple Watch required for active VO2 Max generation, though historical data can be pulled from iPhone via HealthApp).
* An active Apple Developer Account (required for HealthKit entitlements).

### Installation
1. Clone the repository.
2. Open `OxyPeak.xcodeproj` in Xcode.
3. Navigate to **Signing & Capabilities**.
4. Ensure **HealthKit** is added as a capability. 
5. In your `Info.plist`, you **must** include the following privacy keys with clear justifications for App Store review:
   * `NSHealthShareUsageDescription`: "OxyPeak requires access to your VO2 Max data to accurately assess your cardiovascular readiness for specific mountain trails."
   * `NSHealthUpdateUsageDescription`: "OxyPeak uses Health data to track your training progress towards your summit goals."
6. Build and run `(Cmd + R)`.
