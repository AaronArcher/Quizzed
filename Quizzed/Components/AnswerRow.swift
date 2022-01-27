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
    @State private var selectedBox = false
    @State private var selectedCorrect = false
    
    let screenHeight = UIScreen.main.bounds.height
    
    
    var body: some View {
        
        
        ZStack(alignment: .leading) {
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor( Color("Blue3"))
                .frame(height: screenHeight / 12)
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .frame(height: screenHeight / 12)
                .frame(maxWidth: isSelected ? .infinity : 0)
            
            HStack(spacing: 10) {
                Rectangle()
                    .cornerRadius(3)
                    .frame(width: 10, height: 2)
                    .foregroundColor(isSelected ? Color("Blue3") : .white)
                
                Text(answer.text)
                    .foregroundColor(isSelected ? Color("Blue3") : .white)
                    .font(.title3)
                    .fontWeight(.light)
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("Blue3"))
                        .shadow(color: Color("Blue1"), radius: 3, x: 3, y: 3)
                        .scaleEffect(selectedBox ? 1 : 0)
                    
                        Image(systemName: answer.isCorrect ? "checkmark" : "xmark")
                            .font(.system(size: 45))
                            .foregroundColor(Color("Red"))
                            .scaleEffect(selectedCorrect ? 1 : 0)
                }
                
            }
            .padding(.horizontal,10)
            
            
        }
        .onTapGesture {
            if !quizModel.answerSelected {
                withAnimation(.easeInOut) {
                    isSelected = true
                    quizModel.selectAnswer(answer: answer)
                }
                
                withAnimation(.easeInOut.delay(0.4)) {
                    selectedBox = true
                }
                withAnimation(.spring(response: 0.8, dampingFraction: 0.5).delay(0.7)) {
                    selectedCorrect = true
                }
                
            }
        }
        
        //        ZStack {
        //            Color("Blue1")
        //            HStack(spacing: 10) {
        //
        //                Rectangle()
        //                    .cornerRadius(3)
        //                    .frame(width: 10, height: 2)
        //                    .foregroundColor(isSelected ? (answer.isCorrect ? Color("Blue3") : Color("Green3")) : .white)
        //
        //                Text(answer.text)
        //                    .foregroundColor(isSelected ? (answer.isCorrect ? Color("Background") : Color("Green3")) : .white)
        //                    .font(.title3)
        //                    .fontWeight(.light)
        //
        //                if isSelected {
        //                    Spacer()
        //
        //                    Image(systemName: answer.isCorrect ? "checkmark.circle" : "x.circle")
        //                        .font(.system(size: 25, weight: .light))
        //                        .foregroundColor(answer.isCorrect ? Color("Background") : Color("Green3"))
        //                        .padding(.trailing)
        //
        //                }
        //
        //
        //            }
        //            .padding()
        //            .frame(maxWidth: .infinity, alignment: .leading)
        //            .background(isSelected ? (answer.isCorrect ? Color("Green2") : Color("Background")) : Color("Blue3"))
        //            .cornerRadius(10)
        //            .shadow(color: .white, radius: 2, x: 0, y: 0)
        //            .onTapGesture {
        //                if !quizModel.answerSelected {
        //                    withAnimation {
        //                        isSelected = true
        //                        quizModel.selectAnswer(answer: answer)
        //                    }
        //                }
        //        }
        //        }
        
        
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "This is an answer", isCorrect: true))
            .environmentObject(QuizViewModel())
    }
}
