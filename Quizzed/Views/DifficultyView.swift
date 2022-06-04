//
//  DifficultyViewTwo.swift
//  Quizzed
//
//  Created by Aaron Johncock on 26/01/2022.
//

import SwiftUI

struct DifficultyView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var quizModel: QuizViewModel
    
    @State var selectedDifficulty = ""
    
    
    var body: some View {

        VStack(spacing: 0) {
            
            // MARK: Title Bar
                
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                            
                            Image(systemName: "chevron.left")
                                .font(.title)
                                .foregroundColor(Color("Blue3"))
                            
                        }
                        .frame(width: 30, height: 30)
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
                .padding(.horizontal)
                .padding(.vertical, 25)
                .background(
                    RoundedCornerShape(corners: [.bottomLeft, .bottomRight], radius: 25)
                        .foregroundColor(Color("Red"))
                )

            
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
            
            // MARK: Select Difficulty
            Text("Select your difficulty")
                .font(.title2)
                .fontWeight(.light)
                .padding(.vertical)
                .padding(.top, 20)
            
            // MARK: Difficulties
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
                

            Spacer()
            
            // MARK: Start Button
            NavigationLink {
                QuestionView()

            } label: {
                    
                    Text("START")
                        .font(.largeTitle)
                        .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .background(
                            RoundedCornerShape(corners: [.topLeft, .topRight], radius: 25)
                                .foregroundColor(Color("Red"))
                        )
                        .opacity(selectedDifficulty != "" ? 1 : 0.4)
            }
            .disabled(selectedDifficulty != "" ? false : true)

            
        }
        .frame(maxWidth: screenSize().width)
        .ignoresSafeArea()
        .foregroundColor(.white)
        .background(
            LinearGradient(colors: [Color("Blue1"), Color("Blue1"), Color("Blue2"), Color("Blue1"), Color("Blue1")], startPoint: .top, endPoint: .bottom)
        )
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
//        .transition(.move(edge: .trailing)) // After completing the quiz once, transitions seem to be disabled so added transitions manually as well for multiple games


    }
}

struct DifficultyViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyView()
            .environmentObject(QuizViewModel())

    }
}
