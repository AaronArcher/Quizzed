//
//  StatsView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 29/01/2022.
//

import SwiftUI

struct StatsView: View {
    
    @Binding var showStats: Bool
    
    @State private var showingAlert = false
    
    @AppStorage("totalScore")  var totalScore = 0
    @AppStorage("perfectRounds") var perfectRounds = 0
    
    @AppStorage("animalsPlayed") var animalsPlayed = 0
    @AppStorage("filmPlayed") var filmPlayed = 0
    @AppStorage("musicPlayed") var musicPlayed = 0
    @AppStorage("tvPlayed") var tvPlayed = 0
    @AppStorage("videoGamesPlayed") var videoGamesPlayed = 0
    @AppStorage("sciencePlayed") var sciencePlayed = 0
    @AppStorage("mythologyPlayed") var mythologyPlayed = 0
    @AppStorage("comicsPlayed") var comicsPlayed = 0

    
    var body: some View {
        VStack {
            
            // MARK: Header
            HStack {
                Button {
                    showStats = false
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(.white)
                            .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                        
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(Color("Blue1"))
                    }
                    .frame(width: 30, height: 30)
                    
                }
                
                Spacer()
                
                Text("Stats")
                    .font(.title)
                    .fontWeight(.bold)
                    .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                
                    Spacer()
            }
            .padding()
            .padding(.vertical, 5)
            .padding(.bottom, 30)
            
            Spacer()
            
            // MARK: Total Score
            VStack{
                Text("Total Score")
                    .font(.title)
                    .foregroundColor(Color("Red"))
                    .bold()
                
                Text("\(totalScore)")
                    .font(.largeTitle)
            }
            .padding()

            
            // MARK: Perfect Rounds
            VStack{
                Text("Perfect Rounds")
                    .font(.title)
                    .foregroundColor(Color("Red"))
                    .bold()
                
                
                Text("\(perfectRounds)")
                    .font(.largeTitle)
                
            }
            .padding()
            
            Spacer()
            
//            // MARK: Favourite Category
//            Text("Favourite Category")
//                .font(.title)
//                .foregroundColor(Color("Red"))
//                .bold()
//                .padding(.top)
//                .padding(.bottom, 5)
//
//            Text("Mythology")
//                .font(.title3)
//
//
//            Image("Mythology")
//                .resizable()
//                .scaledToFit()
//                .frame(width: screenSize().width / 3)
            
            Spacer()
            
                Button {
                    showingAlert = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: screenSize().width / 3, height: screenSize().height / 16)
                            .foregroundColor(Color("Blue1"))
                            .shadow(color: .black.opacity(0.6), radius: 2, x: 2, y: 2)
                        
                        Text("Clear Score")
                            .font(.headline)
                    }
                }

            
            Spacer()
            
        }
        .foregroundColor(.white)
        .frame(width: screenSize().width - 90)
        .frame(maxHeight: .infinity)
        .background(Color("Blue3"))
        .frame(maxWidth: .infinity, alignment: .leading)
        .alert("Are you sure you want to reset your score?", isPresented: $showingAlert) {
            Button("Yes") {
                totalScore = 0
                perfectRounds = 0
            }
            Button("No", role: .cancel) {}
        }

    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(showStats: .constant(true))
    }
}
