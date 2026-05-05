import HealthKit
import Observation

enum SyncStatus {
    case syncing
    case success
    case failed
    case empty
}

@Observable
class HealthManager {
    @ObservationIgnored let healthStore = HKHealthStore()

    var vo2Max: Double = 0.0
    var height: Double = 0.0
    var weight: Double = 0.0
    var gender: String = "others"
    var dob: Date = Date()
    var isAuthorized: Bool = false
    var syncStatus: SyncStatus = .syncing

    @ObservationIgnored let allTypes: Set = [
        HKQuantityType(.vo2Max),
        HKQuantityType(.height),
        HKQuantityType(.bodyMass),
        HKCharacteristicType(.dateOfBirth),
        HKCharacteristicType(.biologicalSex)
    ]
    
    func requestHealthKitAccess() {
        guard HKHealthStore.isHealthDataAvailable() else {
            self.syncStatus = .empty
            return
        }
        
        healthStore.requestAuthorization(toShare: nil, read: allTypes) { success, error in
            DispatchQueue.main.async {
                if success {
                    self.isAuthorized = true
                    self.fetchAllData()
                    self.syncStatus = .success
                } else {
                    print("[HealthManager] error: \(String(describing: error?.localizedDescription))")
                    self.syncStatus = .failed
                }
            }
        }
    }
    
    func fetchAllData() {
        fetchVO2Max()
        fetchWeight()
        fetchHeight()
        fetchDOB()
        fetchGender()
    }
    
    private func fetchVO2Max() {
        let type = HKQuantityType.quantityType(forIdentifier: .vo2Max)!
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: type, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { _, results, error in
            
            if let error = error {
                print("[HealthManager] VO2Max query error: \(error.localizedDescription)")
                return
            }
            
            guard let sample = results?.first as? HKQuantitySample else {
                print("[HealthManager] VO2Max sync: No data found in Health app.")
                return
            }
            
            DispatchQueue.main.async {
                self.vo2Max = sample.quantity.doubleValue(for: HKUnit.mlPerKgMin())
            }
        }
        healthStore.execute(query)
    }
    
    private func fetchWeight() {
        let type = HKQuantityType.quantityType(forIdentifier: .bodyMass)!
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: type, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { _, results, error in
            
            if let error = error {
                print("[HealthManager] Weight query error: \(error.localizedDescription)")
                return
            }
            
            guard let sample = results?.first as? HKQuantitySample else {
                print("[HealthManager] Weight sync: No data found in Health app.")
                return
            }
            
            DispatchQueue.main.async {
                self.weight = sample.quantity.doubleValue(for: .gramUnit(with: .kilo))
            }
        }
        healthStore.execute(query)
    }
    
    private func fetchHeight() {
        let type = HKQuantityType.quantityType(forIdentifier: .height)!
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: type, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { _, results, error in
            
            if let error = error {
                print("[HealthManager] Height query error: \(error.localizedDescription)")
                return
            }
            
            guard let sample = results?.first as? HKQuantitySample else {
                print("[HealthManager] Height sync: No data found in Health app.")
                return
            }
            
            DispatchQueue.main.async {
                self.height = sample.quantity.doubleValue(for: .meter())
            }
        }
        healthStore.execute(query)
    }
    
    private func fetchDOB() {
        do {
            let dobComponents = try healthStore.dateOfBirthComponents()
            
            guard let dob = dobComponents.date else {
                print("[HealthManager] DOB Error: Date components exist but could not be converted to Date.")
                return
            }
            
            DispatchQueue.main.async {
                self.dob = dob
            }
        } catch {
            print("[HealthManager] error: Failed fetching DOB")
        }
    }
    
    private func fetchGender() {
        do {
            let biologicalSexObject = try healthStore.biologicalSex()
            let sex = biologicalSexObject.biologicalSex
            
            DispatchQueue.main.async {
                switch sex {
                case .female:
                    self.gender = "female"
                case .male:
                    self.gender = "male"
                case .other:
                    self.gender = "others"
                case .notSet:
                    self.gender = "notset"
                @unknown default:
                    self.gender = "others"
                }
            }
        } catch {
            print("[HealthManager] error: Failed fetching gender")
        }
    }
}
