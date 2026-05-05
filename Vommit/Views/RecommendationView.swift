//
//  RecommendationView.swift
//  Vommit
//
//  Created by Christopher Hardy Gunawan on 05/05/26.
//
import SwiftUI

struct RecommendationView: View {
    private let exercises: [Exercise] = DatabaseManager.exerciseRecommendations
    @State private var navigate = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .glassEffect()
                }
                
                Text("Recommendation")
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
            }
            
            Text("Improve VO₂ Max by doing regular exercise to increase endurance")
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray)
                .padding(.horizontal, 40)
            
            VStack {
                ForEach(exercises, id: \.exerciseId) { exercise in
                    HStack {
                        Image(systemName: exercise.imageSystem)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 50)
                            .padding()
                        
                        VStack(alignment: .leading) {
                            Text(exercise.exerciseName)
                                .font(.title3)
                                .bold()
                            Text(exercise.exerciseDesc)
                                .foregroundStyle(.gray)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        Spacer()
                    }
                }
            }
            .padding()
            .background(Color.cardBackground)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            
            Button {
                navigate = true
            } label: {
                Text("Find Another Mountain")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.glassProminent)
            .navigationDestination(isPresented: $navigate) {
                HomeView()
            }
            
            Text("Choose a mountain that matches your\ncurrent VO₂ Max")
                .font(.caption)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    RecommendationView()
}
