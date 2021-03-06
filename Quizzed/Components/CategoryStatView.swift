//
//  CategoryStatView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 26/05/2022.
//

import SwiftUI

struct CategoryStatView: View {
    
    let category: CategoryStat
    
    
    var body: some View {
        
            
            VStack(alignment: .leading) {
                       
                HStack {
                    Text(category.categoryName)
                            .foregroundColor(Color("Red"))
                            .font(.title2)
                            .frame(width: 120, height: 60, alignment: .leading)
                            .lineLimit(2)
                            .dynamicTypeSize(...DynamicTypeSize.xLarge)
                    
                    Spacer()
                    
                    Image(category.categoryName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                }

                    Spacer()
                    
                    HStack {
                        Text("Score:")
                            .font(.subheadline)
                        
                        Spacer()
                        
                        Text("\(category.score)")
                            .foregroundColor(Color("Red"))
                            .font(.headline)
                    }
                    HStack {
                        Text("Games Played:")
                            .font(.subheadline)
                        
                        Spacer()
                        
                        Text("\(category.timesPlayed)")
                            .foregroundColor(Color("Red"))
                            .font(.headline)
                    }
                    HStack {
                        Text("Perfect Rounds:")
                            .font(.subheadline)
                        
                        Spacer()
                        
                        Text("\(category.perfectRound)")
                            .foregroundColor(Color("Red"))
                            .font(.headline)
                    }
                }
                .foregroundColor(.white)
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
                .frame(width: 210)
                .clipShape(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                )
                .accessibilityElement(children: .combine)

        
        
    }
}

struct CategoryStatView_Previews: PreviewProvider {
    
    static var previews: some View {
        CategoryStatView(category: CategoryStat(categoryName: "Science & Nature", score: 30, timesPlayed: 2, perfectRound: 1))
    }
}
