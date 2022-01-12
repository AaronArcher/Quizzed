//
//  ResultView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 12/01/2022.
//

import SwiftUI

struct ResultView: View {
    
    @EnvironmentObject var quizModel: QuizViewModel
    
    @State private var restart = false
    
    var body: some View {
        
        if !restart {
            
            VStack(spacing: 50) {
                Text("Quizzed".uppercased())
                    .font(.largeTitle)
                
                Text("Congratulations")
                    .font(.title2)
                
                Text("You scored \(quizModel.score) out of \(quizModel.length)")
                
                
                Button {
                    
                    restart = true
                    
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("Background"))
                            .frame(width: 160, height: 50)
                        
                        Text("Play Again!")
                            .foregroundColor(Color("Green3"))
                            .font(.title2)
                            .fontWeight(.light)
                    }
                }

                
            }
            .foregroundColor(Color("Background"))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Green3"))
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
        } else {
            CategoryView()
                .environmentObject(quizModel)
        }
        
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
            .environmentObject(QuizViewModel())
    }
}
