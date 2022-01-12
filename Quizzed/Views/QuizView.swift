//
//  QuizView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 10/01/2022.
//

import SwiftUI

struct QuizView: View {
    
    @EnvironmentObject var quizModel: QuizViewModel
    

    
    var c = "20"
    var d = "easy"
    
    var body: some View {
                    
            VStack(spacing: 25) {
                
                HStack {
                    
                    Text("QUIZZED")
                        .foregroundColor(Color("Background"))
                        .font(.title.bold())
                    
                    Spacer()
                    
                    VStack {
                        Text("Question")
                            .bold()
                        
                        Text("\(quizModel.index + 1) out of \(quizModel.length) ")
                            
                    }
                    .foregroundColor(Color("Background"))
                    .font(.subheadline)
                }
                .padding(.top, 10)
            
                ProgressBarView(progress: quizModel.progress)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text(quizModel.question)
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding(.bottom)
                    
                    ForEach(quizModel.answerChoices, id: \.id) { answer in
                        
                        AnswerRow(answer: answer)
                            .environmentObject(quizModel)
                        
                    }
                }
                .padding(.top)
                
                Spacer()
                
                // Next Button
                Button {
                        quizModel.nextQuestion()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 170, height: 50)
                            .foregroundColor(Color("Background"))
                        
                        Text("NEXT")
                            .foregroundColor(Color("Green3"))
                            .font(.title)
                    }
                }
                .disabled(!quizModel.answerSelected)
                
                Spacer()
                
                HStack {
                    Text("SCORE: ")
                    
                    Text("\(quizModel.score)")
                }
                .foregroundColor(Color("Green2"))
                .font(.headline)
                .padding(.bottom,20)
                
                        
            }
            .padding()
            .background(Color("Green3"))
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

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
            .environmentObject(QuizViewModel())
    }
}
