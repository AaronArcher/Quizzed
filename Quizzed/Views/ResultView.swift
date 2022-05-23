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
            return "Congratulations!"
        }
        else if quizModel.score < 4 {
            return "Terrible..."
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
            
            Text("\(quizModel.configuredScore)")
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
            updateStorage()
        }
        
        
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
        } else {
            
        }
    
    }
    
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
            .environmentObject(QuizViewModel())
    }
}
