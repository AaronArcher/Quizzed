//
//  AnswerRow.swift
//  Quizzed
//
//  Created by Aaron Johncock on 10/01/2022.
//

import SwiftUI

struct AnswerRow: View {
    
    @EnvironmentObject var quizModel: QuizViewModel

    var answer: Answer
    @State private var isSelected = false

    var body: some View {
        
        HStack(spacing: 10) {
            
            Rectangle()
                .cornerRadius(3)
                .frame(width: 10, height: 2)
                .foregroundColor(Color("Purple"))
            
            Text(answer.text)
                .foregroundColor(Color("Purple"))
                .font(.title3)
                .fontWeight(.light)
            
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle" : "x.circle")
                    .font(.system(size: 25, weight: .light))
                    .foregroundColor(answer.isCorrect ? Color("Yellow") : Color("Purple"))
                    .padding(.trailing)
                    
            }
            
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: Color("Orange"), radius: 2, x: 0, y: 0)
        .onTapGesture {
            if !quizModel.answerSelected {
                withAnimation {
                    isSelected = true
                    quizModel.selectAnswer(answer: answer)
                }
            }
        }

        
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "This is an answer", isCorrect: true))
            .environmentObject(QuizViewModel())
    }
}
