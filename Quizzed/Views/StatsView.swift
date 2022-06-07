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
    
    @EnvironmentObject var stats: StatsViewModel
    
    
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
                        
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(Color("Blue1"))
                    }
                    .frame(width: 30, height: 30)
                    
                }
                
                Spacer()
                
                Text("Stats")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    showingAlert = true
                } label: {
                    Text("Clear\nScore")
                        .font(.footnote)
                }
                
            }
            .padding(.horizontal)
            .padding(.top, Constants.headerPadding())
            .padding(.bottom, Constants.isScreenLarge ? 25 : 10)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    
                    // MARK: Total Score
                    HStack{
                        Text("Total Score :")
                            .font(.title2)
                            .foregroundColor(Color("Red"))
                            .bold()
                        
                        Spacer()
                        
                        Text("\(stats.totalScore)")
                            .font(.title)
                    }
                    .padding(5)
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
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                    
                    
                    
                    // MARK: Perfect Rounds
                    HStack{
                        Text("Perfect Rounds :")
                            .font(.title2)
                            .foregroundColor(Color("Red"))
                            .bold()
                        
                        Spacer()
                        
                        Text("\(stats.perfectRounds)")
                            .font(.title)
                        
                    }
                    .padding(5)
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
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    
                    // MARK: Best Category
                    Text("Best Category")
                        .font(.title2)
                        .foregroundColor(Color("Gray"))
                        .bold()
                    
                    //                        CategoryStatView(category: stats.bestCategory())
                    //                        .padding(.bottom, 10)
                    
                    HStack {
                        VStack(spacing: 5) {
                            Spacer()
                            
                            Text(stats.bestCategory().categoryName)
                                .font(.title.bold())
                                .foregroundColor(Color("Red"))
                            
                            Image(stats.bestCategory().categoryName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                            
                            Spacer()
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 5) {
                            
                                Text("Score: ")
                                    .font(.title3)
                                
                                + Text("\(stats.bestCategory().score)")
                                    .font(.title3.bold())
                                    .foregroundColor(Color("Red"))
                            
                                Text("Games Played: ")
                                    .font(.title3)
                                
                                + Text("\(stats.bestCategory().timesPlayed)")
                                    .font(.title3.bold())
                                    .foregroundColor(Color("Red"))
                            
                                Text("Perfect Rounds: ")
                                    .font(.title3)
                                
                                + Text("\(stats.bestCategory().perfectRound)")
                                    .font(.title3.bold())
                                    .foregroundColor(Color("Red"))

                        }
                        .multilineTextAlignment(.trailing)
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(
                        ZStack {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color("Blue3"))
                                .shadow(color: Color("Blue1").opacity(0.2), radius: 10, x: 10, y: 10)
                            
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(Color("Blue2"), lineWidth: 15)
                                .blur(radius: 20)
                        }

                    )
                    .padding(.horizontal)
                    
                    
                    //MARK: All Stats
                    Text("All Stats")
                        .font(.title2)
                        .foregroundColor(Color("Gray"))
                        .bold()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(stats.allCategories(), id: \.self) { category in
                                
                                GeometryReader { geo in
                                    //                                let midX = geo.frame(in: .global).minX
                                    
                                    CategoryStatView(category: category)
                                        .padding(.trailing, 5)
                                        .padding(.bottom)
                                    
                                    
                                }
                                .frame(width: 210, height: 150)
                                
                            }
                        }
                    }
                    .padding(.bottom, 10)
                    .padding(.leading, 15)
                    
                    
                }
            }
            
        }
        .ignoresSafeArea()
        .foregroundColor(Color("Gray"))
        .background(
            LinearGradient(colors: [Color("Blue1"), Color("Blue2"), Color("Blue2"), Color("Blue2"), Color("Blue1")], startPoint: .top, endPoint: .bottom)
        )
        .alert("Are you sure you want to reset your statistics?", isPresented: $showingAlert) {
            Button("Yes") {
                stats.resetData()
            }
            Button("No", role: .cancel) {}
        }
        .transition(.move(edge: .top))
        
    }
}

struct StatsView_Previews: PreviewProvider {
    
    static var previews: some View {
        StatsView(showStats: .constant(true))
            .environmentObject(StatsViewModel())
    }
}
