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
                            .foregroundColor(Color("Red"))
                            .frame(width: 160, height: 50)
                        
                        Text("Play Again!")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                }

                
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Blue1"))
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
        } else {
            HomeView()
        }
        
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
            .environmentObject(QuizViewModel())
    }
}
