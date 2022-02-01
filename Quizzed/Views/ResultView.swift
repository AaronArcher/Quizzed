//
//  ResultView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 12/01/2022.
//

import SwiftUI

struct ResultView: View {
    
    @EnvironmentObject var quizModel: QuizViewModel
    
    @State var score: Int = 0
    
    private var resultsText: String {
        if quizModel.score > 7 {
            return "Congratulations!"
        }
        else if quizModel.score < 4 {
            return "Oh no..."
        }
        else {
            return "Not bad!"
        }
    }
    
    
    // Disable animation with navigation Link to HomeViewHolder as the default animation shows the StatsView when sliding in
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        
        
        
        VStack {
            
            ZStack {
                
                RoundedCornerShape(corners: [.bottomLeft, .bottomRight], radius: 25)
                    .frame(height: screenSize().height / 7)
                    .foregroundColor(Color("Red"))
                
                Text(resultsText)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                    .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                
            }
            Spacer()
            
            
//            Text("You scored \(quizModel.score) out of \(quizModel.length)")
            
            HStack {
                
                Text("Correct Answers:")
                
                Spacer()
                
                Text("\(quizModel.score)")
                    .foregroundColor(.white)
                    .bold()
                
            }
            .font(.title)
            .foregroundColor(Color("Red"))
            .padding()
            
            HStack {
                
                Text("Out of:")
                
                Spacer()
                
                Text("\(quizModel.length)")
                    .foregroundColor(.white)
                    .bold()
                
            }
            .font(.title)
            .foregroundColor(Color("Red"))
            .padding()
            
        
            Text("Score")
                .font(.largeTitle)
                .padding(.top)
            
            Text("\(score)")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color("Red"))
            
            Spacer()
            
            
            
            NavigationLink {
                HomeHolderView()
                    .transition(.slide)
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
            
            Spacer()
            
        }
        .ignoresSafeArea()
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Blue1"))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            if quizModel.difficulty == "easy" {
                score = quizModel.score * 5
            }
            else if quizModel.difficulty == "medium" {
                score = quizModel.score * 10
            }
            else {
                score = quizModel.score * 15
            }
        }
        
        
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
            .environmentObject(QuizViewModel())
    }
}
