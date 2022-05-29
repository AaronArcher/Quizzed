//
//  CategoryStatView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 26/05/2022.
//

import SwiftUI

struct CategoryStatView: View {
    
    var category: String = "Science & Nature"
    var score: Int = 15
    var gamesPlayed: Int = 2
    var perfectRounds: Int = 1
    
    var body: some View {
        
//        GeometryReader { geo in
            
            VStack(alignment: .leading) {
                       
                        Text(category)
                            .foregroundColor(Color("Red"))
                            .font(.title2)
                            .frame(width: 120, height: 60, alignment: .topLeading)
                            .lineLimit(2)

                    Spacer()
                    
                    HStack {
                        Text("Score:")
                            .font(.subheadline)
                        
                        Spacer()
                        
                        Text("\(score)")
                            .foregroundColor(Color("Red"))
                            .font(.headline)
                    }
                    HStack {
                        Text("Games Played:")
                            .font(.subheadline)
                        
                        Spacer()
                        
                        Text("\(gamesPlayed)")
                            .foregroundColor(Color("Red"))
                            .font(.headline)
                    }
                    HStack {
                        Text("Perfect Rounds:")
                            .font(.subheadline)
                        
                        Spacer()
                        
                        Text("\(perfectRounds)")
                            .foregroundColor(Color("Red"))
                            .font(.headline)
                    }
                }
                .foregroundColor(Color("Gray"))
                .padding(.horizontal)
                .padding(.vertical, 5)
                .frame(width: 210, height: 150)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color("Blue1"))
                        .shadow(color: Color("Blue1").opacity(0.2), radius: 10, x: 10, y: 10)
            )
//        }
        
        
    }
}

struct CategoryStatView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryStatView()
    }
}
