//
//  HomeView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 25/01/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var quizModel: QuizViewModel

    
    @State private var selectedCategory = ""
    @State private var categoryImage = ""

    
    @State private var showRules = false
    @State var showStats = false
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    
    var body: some View {
        

            NavigationView {
                    VStack(spacing: 0) {
                        
                        // MARK: Title Bar
                      
                            HStack {
                                
                                Button {
                                    withAnimation {
                                        showStats.toggle()
                                    }
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                                        
                                        Image(systemName: "chart.bar.fill")
                                            .font(.title3).dynamicTypeSize(.medium)
                                            .foregroundColor(Color("Blue3"))
                                            .accessibilityLabel("Statistics")
                                        
                                    }
                                    .frame(width: 32, height: 32)
                                }
                                
                                Spacer()
                                
                                Text("QUIZZED")
                                    .font(.largeTitle.bold())
                                    .tracking(5)
                                    .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                                
                                Spacer()
                                
                                Button {
                                    withAnimation {
                                        showRules.toggle()
                                    }
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                                        
                                        
                                        Text("?")
                                            .font(.title.bold()).dynamicTypeSize(.medium)
                                            .foregroundColor(Color("Blue3"))
                                            .accessibilityLabel("Help and rules")
                                        
                                    }
                                    .frame(width: 32, height: 32)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.top, Constants.headerPadding())
                            .padding(.bottom, 25)
                            .background(
                                ZStack {
                                RoundedCornerShape(corners: [.bottomLeft, .bottomRight], radius: 25)
                                    .foregroundColor(Color("Red"))
                                    
                                RoundedCornerShape(corners: [.bottomLeft, .bottomRight], radius: 25)
                                    .stroke(Color("Red2").opacity(0.5), lineWidth: 20)
                                    .blur(radius: 20)
                                }
                            )
                            .clipShape(RoundedCornerShape(corners: [.bottomLeft, .bottomRight], radius: 25))
                                                
                        // MARK: Select Category
                        Text("Select a category")
                            .font(.title2)
                            .padding(.top, 20)
                        
                        
                        // MARK: Categories
                        ScrollView(showsIndicators: false) {
                            
                            
                            LazyVGrid(columns: columns, spacing: 15) {
                                ForEach(categories, id: \.id) { item in
                                    
                                    Button {
                                        if selectedCategory == item.category {
                                            withAnimation {
                                                selectedCategory = ""
                                            }
                                        } else {
                                            withAnimation {
                                                selectedCategory = item.category
                                            }
                                        }
                                        quizModel.categoryID = item.categoryID
                                        quizModel.selectedCategory = item.category
                                        print(selectedCategory)
                                    } label: {
                                        CategoryButton(selectedCategory: $selectedCategory, category: item.category)

                                    }

//                                    CategoryButton(selectedCategory: $selectedCategory, category: item.category)
//                                        .onTapGesture {
//                                            if selectedCategory == item.category {
//                                                withAnimation {
//                                                    selectedCategory = ""
//                                                }
//                                            } else {
//                                                withAnimation {
//                                                    selectedCategory = item.category
//                                                }
//                                            }
//                                            quizModel.categoryID = item.categoryID
//                                            quizModel.selectedCategory = item.category
//                                            print(selectedCategory)
//                                        }
                                }
                            }
                            .padding(.vertical)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: Constants.isScreenLarge ? 600 : 430)
                        .padding(.horizontal)
                        .padding(.top, 10)
                        
                        
                        Spacer()

                        // MARK: Next Button
                        
                        NavigationLink {
                            DifficultyView()

                        } label: {

                            Text("NEXT")
                                .font(.largeTitle)
                                .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                                .frame(maxWidth: .infinity)
                                .padding(.bottom, Constants.bottomButtonPadding())
                                .padding(.top, 15)
                                .background(
                                    ZStack {
                                        RoundedCornerShape(corners: [.topLeft, .topRight], radius: 25)
                                            .foregroundColor(Color("Red"))
                                        
                                        RoundedCornerShape(corners: [.topLeft, .topRight], radius: 25)
                                            .stroke(Color("Red2").opacity(0.5), lineWidth: 20)
                                            .blur(radius: 20)
                                    }
                                )
                                .clipShape(RoundedCornerShape(corners: [.topLeft, .topRight], radius: 25))
                                .opacity(selectedCategory != "" ? 1 : 0.4)
                            
                        }
                        .disabled(selectedCategory != "" ? false : true)

                        
                        
                    }
                    .ignoresSafeArea()
                    .foregroundColor(.white)
                    .background(
                        LinearGradient(colors: [Color("Blue1"), Color("Blue1"), Color("Blue2"), Color("Blue1"), Color("Blue1")], startPoint: .top, endPoint: .bottom)
                    )
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    .rulesPopup(show: $showRules) {
                        rulesContent
                    }
                    .overlay(
                        showStats ?  StatsView(showStats: $showStats.animation()) : nil
                    )
                    
            }

        
    }
    
    @ViewBuilder
    var rulesContent: some View {
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

                        Button {
                            
                        } label: {
                            Text("Open Trivia Database")
                                .font(.footnote)
                                .foregroundColor(Color("Red"))
                        }
                    }
                    .dynamicTypeSize(..<DynamicTypeSize.xLarge)
                    .padding(.top)
                    .padding(.bottom, 8)
                    
                    Button {
                        
                    } label: {
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(QuizViewModel())

    }
}


