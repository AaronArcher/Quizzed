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
    @State var selectedCorrect = false
    
    
    var body: some View {
        
        
        ZStack(alignment: .leading) {
            HStack(spacing: 10) {
                
                Rectangle()
                    .cornerRadius(3)
                    .frame(width: 10, height: 2)
                    .foregroundColor(isSelected ? Color("Blue3") : .white)
                
                Text(answer.text)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(isSelected ? Color("Blue3") : .white)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing,50)
                
                Spacer()
                
            }
            .padding(.leading, 10)
            .background(
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color("Blue3"))
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white)
                        .frame(maxWidth: isSelected ? .infinity : 0)
                }
                    
                )

            HStack {
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: screenSize().height / 12 - 30, height: screenSize().height / 12 - 30)
                        .foregroundColor(Color(hue: 0.365, saturation: 0.0, brightness: 0.94))
                        .shadow(color: Color("Blue1").opacity(0.3), radius: 2, x: 2, y: 2)
                        .scaleEffect(selectedBox ? 1 : 0)
                    
                    Image(systemName: "checkmark")
                        .font(.system(size: 20))
                        .foregroundColor(Color(hue: 0.302, saturation: 1.0, brightness: 0.465))
                        .shadow(color: Color("Blue1").opacity(0.3), radius: 2, x: 2, y: 2)
                        .offset(x: selectedCorrect ? 0 : 40, y: selectedCorrect ? 0 : 40)
                        .opacity((isSelected && selectedCorrect) ? 1 : 0)
                    
                    Image(systemName: "xmark")
                        .font(.system(size: 20))
                        .foregroundColor(Color("Red"))
                        .shadow(color: Color("Blue1").opacity(0.3), radius: 2, x: 2, y: 2)
                        .offset(x: 40, y: 40)
                        .offset(x: (isSelected && !selectedCorrect) ? -40 : 0, y: (isSelected && !selectedCorrect) ? -40 : 0)
                        .animation(.spring(response: 0.5, dampingFraction: 0.5).delay(0.7), value: isSelected)
                        .opacity((isSelected && !selectedCorrect) ? 1 : 0)
                        .animation(.easeInOut.delay(0.7), value: isSelected)
                }
            }
            .padding(.trailing, 10)
            
        }
        .onTapGesture {
            if !quizModel.answerSelected {
                withAnimation(.easeInOut) {
                    isSelected = true
                    quizModel.selectAnswer(answer: answer)
                }
                
                withAnimation(.easeInOut.delay(0.2)) {
                    selectedBox = true
                }
                withAnimation(.spring(response: 0.5, dampingFraction: 0.5).delay(0.4)) {
                    selectedCorrect = answer.isCorrect
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
