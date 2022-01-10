//
//  QuizView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 10/01/2022.
//

import SwiftUI

struct QuizView: View {
    
    @EnvironmentObject var quizModel: QuizViewModel
    
    var body: some View {
                    
            VStack(spacing: 25) {
                
                HStack {
                    
                    Text("QUIZZED")
                        .foregroundColor(Color("Yellow"))
                        .font(.title.bold())
                    
                    Spacer()
                    
                    Text("\(quizModel.index + 1) out of \(quizModel.length) ")
                        .foregroundColor(.white)
                        .font(.title3)
                }
            
                ProgressView(progress: quizModel.progress)
                
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
                
                Button {
                    quizModel.nextQuestion()
                    
                } label: {
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 170, height: 50)
                            .foregroundColor(Color("Yellow"))
                        
                        Text("NEXT")
                            .foregroundColor(Color("Blue"))
                            .font(.title)
                        
                            
                    }
                }
                .disabled(!quizModel.answerSelected)
                .padding(.bottom, 50)

                
                        
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Purple"))
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)

         
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
            .environmentObject(QuizViewModel())
    }
}
