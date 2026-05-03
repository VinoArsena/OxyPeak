import HealthKit
import Observation

@Observable
class HealthManager {
    @ObservationIgnored let healthStore = HKHealthStore()

    var vo2Max: Double = 0.0
    var height: Double = 0.0
    var weight: Double = 0.0
    var gender: String = "others"
    var dob: Date = Date()
    var isAuthorized: Bool = false

    @ObservationIgnored let allTypes: Set = [
        HKQuantityType(.vo2Max),
        HKQuantityType(.height),
        HKQuantityType(.bodyMass),
        HKCharacteristicType(.dateOfBirth),
        HKCharacteristicType(.biologicalSex)
    ]
    
    func requestHealthKitAccess() {
        guard HKHealthStore.isHealthDataAvailable() else { return }
        
        healthStore.requestAuthorization(toShare: nil, read: allTypes) { success, error in
            DispatchQueue.main.async {
                if success {
                    self.isAuthorized = true
                    self.fetchAllData()
                } else {
                    print("[HealthManager] error: \(String(describing: error?.localizedDescription))")
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
        
        let query = HKSampleQuery(sampleType: type, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { _, results, _ in
            guard let sample = results?.first as? HKQuantitySample else { return }
            DispatchQueue.main.async {
                self.vo2Max = sample.quantity.doubleValue(for: HKUnit.gramUnit(with: .milli))
            }
        }
        healthStore.execute(query)
    }
    
    private func fetchWeight() {
        let type = HKQuantityType.quantityType(forIdentifier: .bodyMass)!
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: type, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { _, results, _ in
            guard let sample = results?.first as? HKQuantitySample else { return }
            DispatchQueue.main.async {
                self.weight = sample.quantity.doubleValue(for: .gramUnit(with: .kilo))
            }
        }
        healthStore.execute(query)
    }
    
    private func fetchHeight() {
        let type = HKQuantityType.quantityType(forIdentifier: .height)!
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: type, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { _, results, _ in
            guard let sample = results?.first as? HKQuantitySample else { return }
            DispatchQueue.main.async {
                self.height = sample.quantity.doubleValue(for: .gramUnit(with: .kilo))
            }
        }
        healthStore.execute(query)
    }
    
    private func fetchDOB() {
        do {
            let dob = try healthStore.dateOfBirthComponents()
            
            DispatchQueue.main.async {
                self.dob = dob.date ?? Date()
            }
        } catch {
            print("[HealthManager] error: Failed fetching DOB")
        }
    }
    
    private func fetchGender() {
        do {
            let gender = try healthStore.biologicalSex()
            
            DispatchQueue.main.async {
                self.gender = gender.description
            }
        } catch {
            print("[HealthManager] error: Failed fetching gender")
        }
    }
}
