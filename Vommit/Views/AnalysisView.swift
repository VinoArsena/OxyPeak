import SwiftUI

struct AnalysisView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Top Navigation
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .frame(width: 44, height: 44)
                            .background(Circle().fill(Color.blue))
                    }
                    
                    Text("Analysis")
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .padding(.leading, 8)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 8)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 24) {
                        
                        // Gap Section
                        VStack(spacing: 12) {
                            Text("Gap")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            HStack(alignment: .firstTextBaseline, spacing: 8) {
                                Text("-10.0")
                                    .font(.system(size: 48, weight: .bold))
                                    .foregroundStyle(.red)
                                
                                Text("ml/kg/min")
                                    .font(.subheadline)
                            }
                            
                            Text("You are below the target")
                                .font(.subheadline)
                                .foregroundStyle(.red)
                        }
                        .padding(.top, 24)
                        
                        // Cards Section
                        HStack(spacing: 16) {
                            VStack(spacing: 12) {
                                Text("Your VO₂ Max")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                
                                Text("20.8")
                                    .font(.system(size: 28, weight: .semibold))
                                
                                Text("ml/kg/min")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.vertical, 24)
                            .padding(.horizontal, 12)
                            .background(Color("CardBackground"))
                            .cornerRadius(24)
                            
                            VStack(spacing: 12) {
                                Text("Mountain VO₂ Max Target")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(2)
                                
                                Text("30.8")
                                    .font(.system(size: 28, weight: .semibold))
                                
                                Text("ml/kg/min")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    
                                Text("Daily Requirements for sustained\nascent performance")
                                    .font(.system(size: 10))
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.center)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.vertical, 24)
                            .padding(.horizontal, 12)
                            .background(Color("CardBackground"))
                            .cornerRadius(24)
                        }
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal)
                        
                        // The Science Behind Section
                        HStack(alignment: .top, spacing: 16) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.white, lineWidth: 2)
                                    .frame(width: 32, height: 42)
                                VStack(spacing: 3) {
                                    Image(systemName: "exclamationmark.triangle.fill")
                                        .font(.system(size: 10))
                                    Rectangle()
                                        .frame(width: 14, height: 2)
                                    Rectangle()
                                        .frame(width: 14, height: 2)
                                }
                            }
                            .padding(.top, 4)
                            
                            VStack(alignment: .leading, spacing: 12) {
                                Text("The Science Behind")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                
                                Text("Using your route gradient and ascent window, we've calculated the minimum engine size (VO₂ Max) required to complete your summit safely.")
                                    .font(.subheadline)
                                    .foregroundColor(Color.white.opacity(0.7))
                                    .lineSpacing(4)
                            }
                        }
                        .padding(.vertical, 24)
                        .padding(.horizontal, 20)
                        .background(Color("CardBackground"))
                        .cornerRadius(24)
                        .padding(.horizontal)
                        
                        // Next Action Button
                        Button {
                            
                        } label: {
                            HStack {
                                Image(systemName: "arrow.right")
                                Text("Next Action")
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 14)
                            .background(Color.blue)
                            .cornerRadius(30)
                        }
                        .padding(.top, 16)
                        
                    }
                    .padding(.bottom, 40)
                }
            }
        }
        .preferredColorScheme(.dark)
        .navigationBarHidden(true)
    }
}

#Preview {
    AnalysisView()
}
