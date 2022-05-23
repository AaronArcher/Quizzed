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
            ZStack {
                
                RoundedCornerShape(corners: [.bottomLeft, .bottomRight], radius: 25)
                    .frame(height: screenSize().height / 7)
                    .foregroundColor(Color("Red"))

                
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
                
            }
            
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

            
            
           
//            VStack(spacing: 10) {
//                Text(quizModel.selectedCategory)
//                        .font(.title)
//                        .fontWeight(.light)
//
//                Image(quizModel.selectedCategory)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 60)
//
//
//                }
//                .padding(.top, 40)
                
                

            Spacer()
            
            // MARK: Start Button
            NavigationLink {
                QuestionView()

            } label: {
                ZStack{
                    RoundedCornerShape(corners: [.topLeft, .topRight], radius: 25)
                        .frame(height: screenSize().height / 9)
                        .foregroundColor(Color("Red"))
                    
                    
                    Text("START")
                        .font(.largeTitle)
                        .padding(.bottom, 10)
                        .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                    
                }
                .opacity(selectedDifficulty != "" ? 1 : 0.4)
            }
            .disabled(selectedDifficulty != "" ? false : true)

            
        }
        .frame(maxWidth: screenSize().width)
        .ignoresSafeArea()
        .foregroundColor(.white)
        .background(Color("Blue1"))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)

    }
}

struct DifficultyViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyView()
            .environmentObject(QuizViewModel())

    }
}
