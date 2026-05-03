import SwiftUI

struct AnalysisView: View {
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 16) {
                Text("Analysis")
                    .font(.title.bold())
                
                VStack(spacing: 12) {
                    Text("Gap")
                        .font(.title3.bold())
                    
                    HStack {
                        Text("-10.50")
                            .font(.title.bold())
                            .foregroundStyle(.red)
                        
                        Text("ml/kg/min")
                            
                    }
                    
                    Text("You are below the target")
                        .foregroundStyle(.red)
                }
                .padding(16)
                
                HStack(spacing: 16) {
                    VStack(spacing: 8) {
                        Text("Current")
                            .font(.headline)
                        
                        Text("20.8")
                            .font(.title3.bold())
                        
                        Text("ml/kg/min")
                        
                    }
                    .frame(width: 90)
                    .padding(16)
                    .background(Color("CardBackground"))
                    .cornerRadius(26)
                    
                    VStack(spacing: 8) {
                        Text("Mountain VO₂ Max")
                            .font(.headline)
                        
                        Text("20.8")
                            .font(.title3.bold())
                        
                        Text("ml/kg/min")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(16)
                    .background(Color("CardBackground"))
                    .cornerRadius(26)
                }
                .frame(maxWidth: .infinity)
                
                HStack(spacing: 16) {
                    Image(systemName: "house.fill")
                        .font(.largeTitle)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("The Science Behind")
                            .font(.headline)
                        
                        Text("Using your route gradient and ascent window, we’ve calculated the minimum engine size (VO₂ Max) required to complete your summit safely.")
                            .font(.body)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(16)
                .background(Color("CardBackground"))
                .cornerRadius(26)
                
                Button {
                    
                } label: {
                    Text("Next")
                }
                .buttonStyle(.glass)
                
                Spacer()
            }
            .padding(24)
        }
        .preferredColorScheme(.dark)
        .background(Color("Background"))
        
    }
}


#Preview {
    AnalysisView()
}
