//
//  UpdateVO2MaxModal.swift
//  OxyPeak
//
//  Created by Christopher Hardy Gunawan on 06/05/26.
//
import SwiftUI

struct UpdateVO2MaxView: View {
    @State private var newValue: String = ""
    @State private var oldValue: String = "Old Value: 20.8"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Update VO₂ Max")
                .bold()
            
            VStack(alignment: .leading) {
                TextField("New Value", text: $oldValue)
                    .padding(12)
                    .disabled(true)
                
                Divider()
                
                HStack {
                    TextField("New Value", text: $newValue)
                        .padding(12)
                        .keyboardType(.decimalPad)
                    
                    Spacer()
                    
                    Text("ml/kg/min")
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .glassEffect(in: RoundedRectangle(cornerRadius: 24))
            
            Button {
                
            } label: {
                Text("Save")
                    .padding(.vertical, 4)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.glassProminent)
            
            Button {
                
            } label: {
                Text("Cancel")
                    .padding(.vertical, 4)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.glass)
            
        }
        .padding(24)
        .frame(maxWidth: .infinity)
        .glassEffect(in: RoundedRectangle(cornerRadius: 40))
        .preferredColorScheme(.dark)
        .padding(30)
    }
}

#Preview {
    UpdateVO2MaxView()
}
