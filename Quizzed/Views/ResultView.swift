//
//  ResultView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 12/01/2022.
//

import SwiftUI

struct ResultView: View {
    
    @EnvironmentObject var quizModel: QuizViewModel
    @EnvironmentObject var stats: StatsViewModel

    
    private var resultsText: String {
        
        if quizModel.score == 10 {
            return "Perfect Score!"
        }
        else if quizModel.score > 7 {
            return "Awesome!"
        }
        else if quizModel.score < 4 {
            return "Could be better..."
        }
        else {
            return "Not bad!"
        }
    }
    
    
    var body: some View {
        
        
        VStack {
            
            Text(resultsText)
                .font(.title)
                .foregroundColor(Color("Red"))
                .padding(.top, 25)
                .padding(.vertical)
            
            Text(quizModel.selectedCategory)
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.top)
                
            
            Image(quizModel.selectedCategory)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .padding(.bottom, 20)
            
            
            HStack {
                
                Text("Correct answers:")
                    .foregroundColor(.white)

                Spacer()
                
                Text("\(quizModel.score) / 10")
                    .foregroundColor(Color("Red"))
                    .bold()
                
            }
            .font(.title)
            .padding(10)
            .padding(.horizontal, 10)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color("Blue3"))
                        .shadow(color: Color("Blue1").opacity(0.2), radius: 10, x: 10, y: 10)
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color("Blue2"), lineWidth: 5)
                        .blur(radius: 10)
                }
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            )
            .padding()
            .padding(.top, 20)
            
        
            Text("SCORE")
                .font(Font.system(size: 50).bold())
                .foregroundStyle(
                    LinearGradient(colors: [Color("Red2"), Color("Red"), Color("Red"), Color("Red"), Color("Red2")], startPoint: .leading, endPoint: .trailing)
                )
                .padding(.top)
            
            Text("\(quizModel.configuredScore)")
                .font(Font.system(size: 50).bold())
                .foregroundColor(.white)
            
            Spacer()
            
            
            
            NavigationLink {
                HomeHolderView()

            } label: {
                            
                    Text("Play Again!")
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .foregroundColor(Color("Red"))
                        )
            }
            
            Spacer()
            
        }
        .ignoresSafeArea()
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Backgrounds.gradient
        )
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            stats.updateStat(category: quizModel.selectedCategory, score: quizModel.configuredScore, perfectRound: quizModel.score == 10)
        }
        .overlay(
            ConfettiView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .allowsHitTesting(false)
                .accessibilityHidden(true)
        )
            
        
    }
    
    
}

//struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView()
//            .environmentObject(QuizViewModel())
//    }
//}
