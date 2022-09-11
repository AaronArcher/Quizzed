//
//  RulesPopup.swift
//  Quizzed
//
//  Created by Aaron Johncock on 11/09/2022.
//

import SwiftUI

struct RulesPopup: View {
    
    @Binding var showRules: Bool
    
    var body: some View {

        ZStack(alignment: .center) {
            ZStack(alignment: .top) {

                VStack(spacing: 0) {
                    Text("Welcome to")
                        .font(.title3)

                    Text("QUIZZED")
                        .font(.title)
                        .foregroundColor(Color("Red"))
                        .padding(.bottom, 10)
                    
                    Text("Simply select a category and difficulty to start your quiz.")
                        .font(.subheadline)
                        .padding(.top)
                    
                    Text("Points earned will depend on your difficulty selected:")
                        .font(.subheadline)
                        .padding(.top, 10)
                        .padding(.bottom)
                    
                    VStack(spacing: 10) {

                        Text("EASY")
                            .font(.title2)
                            .foregroundColor(Color("Red"))
                            
                        + Text("   5 points each")
                            .font(.subheadline)
                        
                        
                        Text("MEDIUM")
                            .font(.title2)
                            .foregroundColor(Color("Red"))
                            
                        + Text("   10 points each")
                            .font(.subheadline)
                       
                        Text("HARD")
                            .font(.title2)
                            .foregroundColor(Color("Red"))
                           
                        + Text("   15 points each")
                            .font(.subheadline)
                        
                    }
                    .dynamicTypeSize(..<DynamicTypeSize.xLarge)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    
                    HStack {
                        Text("Powered by: ")
                            .font(.footnote)

                        Link(destination: URL(string: "https://opentdb.com")!) {
                            Text("Open Trivia Database")
                                .font(.footnote)
                                .foregroundColor(Color("Red"))
                        }
                    }
                    .dynamicTypeSize(..<DynamicTypeSize.xLarge)
                    .padding(.top)
                    .padding(.bottom, 8)
                    
                    
                    Link(destination: URL(string: "https://github.com/AaronArcher/Quizzed-Privacy-Policy/blob/main/README.md")!) {
                        Text("Privacy Policy")
                            .font(.caption)
                            .dynamicTypeSize(..<DynamicTypeSize.xLarge)
                    }
                    
                   
                }
                .frame(maxWidth: screenSize().width / 1.4)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding()

                HStack {

                    Spacer()

                    Button {
                        withAnimation {
                            showRules.toggle()
                        }
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
                }
                .padding()

            }
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color("Blue1"))
            )
            .frame(width: screenSize().width / 1.2)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .onTapGesture {
            withAnimation {
                showRules.toggle()
            }
        }

    }
}

struct RulesPopup_Previews: PreviewProvider {
    static var previews: some View {
        RulesPopup(showRules: .constant(true))
    }
}
