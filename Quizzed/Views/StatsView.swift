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
                .padding(.horizontal)
                .padding(.bottom, 10)
                
                
                
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
                .padding(.horizontal)
                .padding(.bottom)
                
                Group {
                    // MARK: Best Category
                    Text("Best Category")
                        .font(.title2)
                        .underline()
                        .foregroundColor(Color("Red"))
                        .bold()
                    
                    CategoryStatView(category: stats.bestCategory())
                    .padding(.bottom)
                    
                    Text("Film: \(stats.film.score), \(stats.film.timesPlayed)")
                }
               
                
                
                //MARK: All Stats
                Text("All Stats")
                    .font(.title2)
                    .foregroundColor(Color("Red"))
                    .bold()
                    .underline()
                
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
                .padding(.bottom)
                .padding(.leading, 15)
                
                
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
        .background(
            LinearGradient(colors: [Color("Blue2"), Color("Blue3"), Color("Blue3"), Color("Blue3"), Color("Blue2")], startPoint: .top, endPoint: .bottom)
        )
        .alert("Are you sure you want to reset your score?", isPresented: $showingAlert) {
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
