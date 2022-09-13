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
            updateStorage()
        }
        .overlay(
            ConfettiView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .allowsHitTesting(false)
                .accessibilityHidden(true)
        )
            
        
    }
    
    func updateStorage() {
        stats.totalScore += quizModel.configuredScore
        stats.gamesPlayed += 1
        if quizModel.score == 10 {
            stats.perfectRounds += 1
        }
        updateCategoryStat()
        
    }
    
    func updateCategoryStat() {
        
        if quizModel.selectedCategory == "Film" {
            stats.film.timesPlayed += 1
            stats.film.score += quizModel.configuredScore
            if quizModel.score == 10 {
                stats.film.perfectRound += 1
            }
        } else if quizModel.selectedCategory == "Music" {
            stats.music.timesPlayed += 1
            stats.music.score += quizModel.configuredScore
            if quizModel.score == 10 {
                stats.music.perfectRound += 1
            }
        } else if quizModel.selectedCategory == "Television" {
            stats.television.timesPlayed += 1
            stats.television.score += quizModel.configuredScore
            if quizModel.score == 10 {
                stats.television.perfectRound += 1
            }
        } else if quizModel.selectedCategory == "Video Games" {
                stats.videoGames.timesPlayed += 1
                stats.videoGames.score += quizModel.configuredScore
                if quizModel.score == 10 {
                    stats.videoGames.perfectRound += 1
            }
        } else if quizModel.selectedCategory == "Science & Nature" {
            stats.scienceAndNature.timesPlayed += 1
            stats.scienceAndNature.score += quizModel.configuredScore
            if quizModel.score == 10 {
                stats.scienceAndNature.perfectRound += 1
            }
        } else if quizModel.selectedCategory == "Mythology" {
            stats.mythology.timesPlayed += 1
            stats.mythology.score += quizModel.configuredScore
            if quizModel.score == 10 {
                stats.mythology.perfectRound += 1
            }
        } else if quizModel.selectedCategory == "Animals" {
            stats.animals.timesPlayed += 1
            stats.animals.score += quizModel.configuredScore
            if quizModel.score == 10 {
                stats.animals.perfectRound += 1
            }
        } else if quizModel.selectedCategory == "Comics" {
            stats.comics.timesPlayed += 1
            stats.comics.score += quizModel.configuredScore
            if quizModel.score == 10 {
                stats.comics.perfectRound += 1
            }
        }  else if quizModel.selectedCategory == "General Knowledge" {
            stats.generalKnowledge.timesPlayed += 1
            stats.generalKnowledge.score += quizModel.configuredScore
            if quizModel.score == 10 {
                stats.generalKnowledge.perfectRound += 1
            }
        }  else if quizModel.selectedCategory == "Sport" {
            stats.sport.timesPlayed += 1
            stats.sport.score += quizModel.configuredScore
            if quizModel.score == 10 {
                stats.sport.perfectRound += 1
            }
        } else {
            
        }
    
    }
    
}

//struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView()
//            .environmentObject(QuizViewModel())
//    }
//}
