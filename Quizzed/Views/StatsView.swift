//
//  StatsView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 29/01/2022.
//

import SwiftUI

struct StatsView: View {
    
    @Binding var showStats: Bool
    
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
                    .font(.title3)
                    .foregroundColor(Color("Red"))
                    .bold()
                Spacer()
                
                Text("865")
                    .font(.title)
                
            }
            .padding(.horizontal)
            .padding(.trailing)

            
            // MARK: Perfect Rounds
            HStack{
                Text("Perfect Rounds :")
                    .font(.title3)
                    .foregroundColor(Color("Red"))
                    .bold()
                
                Spacer()
                
                Text("6")
                    .font(.title)
                
            }
            .padding(.horizontal)
            .padding(.trailing)
            
            // MARK: Favourite Category
            Text("Favourite Category")
                .font(.title)
                .foregroundColor(Color("Red"))
                .bold()
                .padding(.top)
                .padding(.bottom, 5)
            
            Text("Mythology")
                .font(.title3)
            
            
            Image("Mythology")
                .resizable()
                .scaledToFit()
                .frame(width: screenSize().width / 3)
            
            Spacer()
            
            HStack{
                Button {
                    
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

            }
            .padding()
            
            Spacer()
            
        }
        .foregroundColor(.white)
        .frame(width: screenSize().width - 90)
        .frame(maxHeight: .infinity)
        .background(Color("Blue3"))
        .frame(maxWidth: .infinity, alignment: .leading)

    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(showStats: .constant(true))
    }
}
