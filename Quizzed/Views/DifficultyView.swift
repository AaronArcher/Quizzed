//
//  DifficultyViewTwo.swift
//  Quizzed
//
//  Created by Aaron Johncock on 26/01/2022.
//

import SwiftUI

struct DifficultyView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var quizModel: QuizViewModel
    
    @State var selectedDifficulty = ""
    
    
    var body: some View {

        VStack(spacing: 0) {
            
            // MARK: Header
            header
            
            // MARK: Selected Category
            VStack(spacing: 10) {
                Text(quizModel.selectedCategory)
                        .font(.title)
                        .fontWeight(.light)
                    
                Image(quizModel.selectedCategory)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60)

                    
                }
                .padding(.top, 40)
            
            // MARK: Difficulties
            Text("Select your difficulty")
                .font(.title2)
                .fontWeight(.light)
                .padding(.top, 30)
            
            difficulties
                

            Spacer()
            
            // MARK: Start Button
            startButton

            
        }
        .ignoresSafeArea()
        .foregroundColor(.white)
        .background(
            Backgrounds.gradient
        )
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)


    }
    
    var header: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                ZStack {
                    HeaderButton()
                    
                    Image(systemName: "chevron.left")
                        .font(.title).dynamicTypeSize(.medium)
                        .foregroundColor(Color("Blue3"))
                    
                }
                .frame(width: 32, height: 32)
            }
            
            Spacer()
            
            Text("QUIZZED")
                .font(.largeTitle)
                .fontWeight(.bold)
                .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.clear)
                
            }
            .frame(width: 30, height: 30)
        }
        .headerShapeModifier()
        
    }
    
    var difficulties: some View {
        Group {
            DifficultyButton(selectedDifficulty: $selectedDifficulty, difficulty: "easy")
                .onTapGesture {
                    if selectedDifficulty == "easy" {
                        withAnimation(.easeInOut) {
                            selectedDifficulty = ""
                            quizModel.difficulty = ""
                        }
                    } else {
                        withAnimation(.easeInOut) {
                            selectedDifficulty = "easy"
                            quizModel.difficulty = selectedDifficulty
                        }
                    }
                }
            
            DifficultyButton(selectedDifficulty: $selectedDifficulty, difficulty: "medium")
                .onTapGesture {
                    if selectedDifficulty == "medium" {
                        withAnimation(.easeInOut) {
                            selectedDifficulty = ""
                            quizModel.difficulty = ""
                        }
                    } else {
                        withAnimation(.easeInOut) {
                            selectedDifficulty = "medium"
                            quizModel.difficulty = selectedDifficulty
                        }
                    }

                }
            
            DifficultyButton(selectedDifficulty: $selectedDifficulty, difficulty: "hard")
                .onTapGesture {
                    if selectedDifficulty == "hard" {
                        withAnimation(.easeInOut) {
                            selectedDifficulty = ""
                            quizModel.difficulty = ""
                        }
                    } else {
                        withAnimation(.easeInOut) {
                            selectedDifficulty = "hard"
                            quizModel.difficulty = selectedDifficulty
                        }
                    }

                }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
    
    var startButton: some View {
        NavigationLink {
            QuestionView()

        } label: {
                
                Text("START")
                    .font(.largeTitle)
                    .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, ScreenOptions.bottomButtonPadding())
                    .padding(.top, 15)
                    .background(
                        ZStack {
                            RoundedCornerShape(corners: [.topLeft, .topRight], radius: 25)
                                .foregroundColor(Color("Red"))
                            
                            RoundedCornerShape(corners: [.topLeft, .topRight], radius: 25)
                                .stroke(Color("Red2").opacity(0.5), lineWidth: 20)
                                .blur(radius: 20)
                        }
                    )
                    .clipShape(RoundedCornerShape(corners: [.topLeft, .topRight], radius: 25))
                    .opacity(selectedDifficulty != "" ? 1 : 0.4)
        }
        .disabled(selectedDifficulty != "" ? false : true)
    }
    
}

struct DifficultyViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyView()
            .environmentObject(QuizViewModel())

    }
}
