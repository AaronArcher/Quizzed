//
//  Rules.swift
//  Quizzed
//
//  Created by Aaron Johncock on 29/01/2022.
//

import SwiftUI

struct RulesView: View {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @Binding var showRules: Bool
    
    var body: some View {

        ZStack(alignment: .center) {
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color("Blue1"))

                VStack(spacing: 0) {
                    Text("Welcome to")
                        .font(.title3)

                    Text("QUIZZED")
                        .font(.title)
                        .foregroundColor(Color("Red"))
                        .padding(.bottom, 20)
                    
                    Text("Simply select a category and difficulty to start your quiz.")
                        .font(.subheadline)
                        .padding(.top)
                    
                    Text("Points earned will depend on your difficulty selected:")
                        .font(.subheadline)
                        .padding(.vertical)
                        .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        HStack{
                            Text("EASY")
                                .font(.title2)
                                .foregroundColor(Color("Red"))
                           
                            Spacer()
                            
                            Text("5 points each")
                                .font(.subheadline)
                        }
                        .padding(.top,10)
                        
                        HStack(spacing: 20){
                            Text("MEDIUM")
                                .font(.title2)
                                .foregroundColor(Color("Red"))
                            
                            Spacer()

                            Text("10 points each")
                                .font(.subheadline)
                        }
                        .padding(.top, 10)
                       
                        HStack(spacing: 20){
                            Text("HARD")
                                .font(.title2)
                                .foregroundColor(Color("Red"))
                           
                            Spacer()

                            Text("15 points each")
                                .font(.subheadline)
                        }
                        .padding(.top, 10)
                    }
                    .padding(.horizontal)
                    
                   
                }
                .frame(maxWidth: screenWidth / 1.4)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding()

                HStack {

                    Spacer()

                    Button {
                        showRules = false
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
                }
                .padding()

            }
            .frame(width: screenWidth / 1.2, height: screenHeight / 1.7)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(.ultraThinMaterial)


    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView(showRules: .constant(true))
    }
}
