//
//  ProfileView Component.swift
//  Vommit
//
//  Created by Victorsianus Dwi K on 04/05/26.
//

import SwiftUI

struct EditProfileView: View {
    // 1. State variables untuk menampung data input
    @State private var age: String = "25"
    @State private var selectedGender: String = "Male"
    @State private var height: String = "170"
    @State private var weight: String = "65"
    @State private var vo2Max: String = "35"
    
    let genders = ["Male", "Female", "Other"]
    
    var body: some View {
        NavigationView {
            Form {
                // Section Informasi Dasar
                Section(header: Text("Physical Information")) {
                    
                    // Input Umur
                    HStack {
                        Text("Age")
                        Spacer()
                        TextField("0", text: $age)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.secondary)
                    }
                    
                    // Input Gender (Dropdown)
                    Picker("Gender", selection: $selectedGender) {
                        ForEach(genders, id: \.self) { gender in
                            Text(gender)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                // Section Pengukuran Tubuh
                Section(header: Text("Body Metrics"), footer: Text("Data ini digunakan untuk kalkulasi performa olahraga Anda.")) {
                    
                    // Input Tinggi Badan
                    HStack {
                        Text("Height")
                        Spacer()
                        TextField("0", text: $height)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.secondary)
                        Text("cm").foregroundColor(.secondary).font(.caption)
                    }
                    
                    // Input Berat Badan
                    HStack {
                        Text("Weight")
                        Spacer()
                        TextField("0", text: $weight)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.secondary)
                        Text("kg").foregroundColor(.secondary).font(.caption)
                    }
                }
                
                // Section Performa
                Section(header: Text("Athletic Performance")) {
                    HStack {
                        Text("VO₂ Max")
                        Spacer()
                        TextField("0.0", text: $vo2Max)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    }
                }
                
                // Button Simpan
                Section {
                    Button(action: {
                        saveData()
                    }) {
                        Text("Save Changes")
                            .frame(maxWidth: .infinity)
                            .alignmentGuide(.leading) { _ in 0 }
                            .bold()
                    }
                }
            }
            .navigationTitle("Edit Profile")
            .preferredColorScheme(.dark) // Sesuai tema SportyAlarm
        }
    }
    
    func saveData() {
        // Logic simpan data di sini
        print("Data tersimpan: \(age), \(selectedGender), \(vo2Max)")
    }
}

#Preview {
    EditProfileView()
}
