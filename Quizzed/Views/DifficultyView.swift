//
//  DifficultyView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 09/01/2022.
//

import SwiftUI

struct DifficultyView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var quizModel: QuizViewModel
    
    let width = UIScreen.main.bounds.width
    
    @Binding var selectedCategory: String
    
    @State var selectedDifficulty = "easy"
    
    var body: some View {
        
        
        VStack(spacing: 20) {
            
            Text("QUIZZED")
                .foregroundColor(Color("Green3"))
                .font(.system(size: 45, weight: .bold))
                .padding(.top, 10)
            
            Text("SELECT A DIFFICULTY")
                .foregroundColor(Color("Green3"))
                .font(.title2)
                .fontWeight(.light)
                .padding(.bottom, 20)
            
            
            // Difficulties
            Group {
                DifficultyBlock(selectedDifficulty: $selectedDifficulty, difficulty: "easy", color: "Green2")
                    .onTapGesture {
                        withAnimation {
                            selectedDifficulty = "easy"
                            quizModel.difficulty = selectedDifficulty
                        }

                    }
                    .frame(width: width - 40, height: 65)
                
                DifficultyBlock(selectedDifficulty: $selectedDifficulty, difficulty: "medium", color: "Green2")
                    .onTapGesture {
                        withAnimation {
                            selectedDifficulty = "medium"
                            quizModel.difficulty = selectedDifficulty
                        }
                        
                    }
                    .frame(width: width - 40, height: 65)

                DifficultyBlock(selectedDifficulty: $selectedDifficulty, difficulty: "hard", color: "Green2")
                    .onTapGesture {
                        withAnimation {
                            selectedDifficulty = "hard"
                            quizModel.difficulty = selectedDifficulty
                        }
                        
                    }
                    .frame(width: width - 40, height: 65)
            }
            
            Spacer()
            
            Group {
                // Selected category
                VStack(spacing: 0) {
                    Text("Category selected:".uppercased())
                        .foregroundColor(Color("Green3"))
                        .font(.title2)
                        .padding(.top)
                        .padding(.bottom, 5)
                    
                    Text(selectedCategory.uppercased())
                        .foregroundColor(Color("Green2"))
                        .font(.title3)
                }
                
                // Selected Difficulty
                VStack(spacing: 0) {
                    Text("Difficulty selected:".uppercased())
                        .foregroundColor(Color("Green3"))
                        .font(.title2)
                        .padding(.top)
                        .padding(.bottom, 5)
                    
                    Text(selectedDifficulty.uppercased())
                        .foregroundColor(Color("Green2"))
                        .font(.title3)
                    
                }
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 5)
                .frame(width: UIScreen.main.bounds.width - 40, height: 1)
                .foregroundColor(Color("Green3"))
            
            
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    
                    Image(systemName: "arrow.left")
                        .font(.system(size: 30, weight: .light))
                        .padding(.horizontal)
                    
                    Text("BACK")
                        .font(.title)
                        .fontWeight(.light)
                }
                
                Spacer()
                
                NavigationLink {
                    QuizView()
                        .environmentObject(quizModel)
                    
                } label: {
                    
                    Text("START")
                        .font(.title)
                        .fontWeight(.light)
                    
                    Image(systemName: "arrow.right")
                        .font(.system(size: 30, weight: .light))
                        .padding(.horizontal)
                    
                }
            }
            .foregroundColor(Color("Green3"))
            
            Spacer()
            
        }
        .padding()
        .background(Color("Background"))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
        
    }
}

struct DifficultyView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyView(selectedCategory: .constant("Comics"))
            .environmentObject(QuizViewModel())
    }
}

struct DifficultyBlock: View {
    
    @Binding var selectedDifficulty: String
    
    var difficulty: String
    var color: String
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(Color(color))
                .frame(height: 65)
            
            Text(difficulty.uppercased())
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.light)
            
            DifficultyShape1()
                .trim(from: 0, to: selectedDifficulty == difficulty ? 1 : 0)
                .stroke(.white, lineWidth: 1.5)
            
            DifficultyShape2()
                .trim(from: 0, to: selectedDifficulty == difficulty ? 1 : 0)
                .stroke(.white, lineWidth: 1.5)
            
        }
        
    }
}

struct DifficultyShape1: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            
            path.move(to: CGPoint(x: rect.minX + 20, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX - 80, y: rect.midY))
            
            
        }
    }
}

struct DifficultyShape2: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            
            path.move(to: CGPoint(x: rect.maxX - 20, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX + 80, y: rect.midY))
            
            
        }
    }
}
