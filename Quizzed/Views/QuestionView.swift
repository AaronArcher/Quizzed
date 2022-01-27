//
//  QuestionView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 27/01/2022.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var quizModel: QuizViewModel
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @Binding var selectedCategory: String
    @Binding var categoryImage: String
    
    var body: some View {
        
        
        if quizModel.reachedEnd {
            
            ResultView()
                .environmentObject(quizModel)
            
        } else {
            
        VStack(spacing: 0) {
            
            // MARK: Header
            ZStack {
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: screenHeight / 6)
                    .foregroundColor(Color("Red"))
                
                    .mask(RoundedRectangle(cornerRadius: 25))
                    .offset(y: -20)
                
                HStack(spacing: 15) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color("Blue3"))
                            .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                        
                        Image(categoryImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                    }
                    .frame(width: 40, height: 40)
                    
                    Text(selectedCategory)
                        .foregroundColor(.white)
                        .font(.title2)
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color("Blue3"))
                            .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                        
                        Image(systemName: "xmark")
                            .font(.title)
                    }
                    .frame(width: 40, height: 40)
                }
                .padding(.horizontal)
            }
            
            //MARK: Score
            HStack {
                
                VStack {
                    Text("Question")
                        .font(.headline)
                    
                    Text("\(quizModel.index + 1) out of \(quizModel.length) ")
                        .font(.subheadline)
                }
                
                Spacer()
                
                VStack {
                    Text("Score")
                        .font(.headline)
                    
                    Text("\(quizModel.score)")
                        .font(.subheadline)
                }
            }
            .padding(.horizontal, 40)
            .padding(.top)
            
    
            ProgressBarView(progress: quizModel.progress)
                .padding(.top, 10)
                .padding(.horizontal, 30)
            
            // MARK: Questions
            VStack(alignment: .leading, spacing: 10) {
                
                Text(quizModel.question)
                    .foregroundColor(.white)
                    
                ForEach(quizModel.answerChoices, id: \.id) { answer in
                    
                    AnswerRow(answer: answer)
                        .environmentObject(quizModel)
                }
                
                    
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            Spacer()
            
            
            Button {
                quizModel.nextQuestion()
            } label: {
                ZStack{
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: screenHeight / 7)
                        .foregroundColor(Color("Red").opacity(1))
                    
                        .mask(RoundedRectangle(cornerRadius: 25))
                        .offset(y: 30)
                    
                    
                    Text("NEXT")
                        .font(.largeTitle)
                        .padding(.top, 25)
                        .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                    
                }
                .opacity(!quizModel.answerSelected ? 0.4 : 1)
            }
            .disabled(!quizModel.answerSelected)

            
        }
        .ignoresSafeArea()
        .foregroundColor(.white)
        .background(Color("Blue1"))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .task {
            do {
                try await quizModel.fetchQuiz()
            } catch {
                print("Error", error)
            }
        }
    }
        
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(selectedCategory: .constant("Animals"), categoryImage: .constant("Animals"))
            .environmentObject(QuizViewModel())
        
    }
}
