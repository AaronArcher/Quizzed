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
                        ZStack {
                            
                            RoundedCornerShape(corners: [.bottomLeft, .bottomRight], radius: 25)
                                .frame(height: screenSize().height / 7)
                                .foregroundColor(Color("Red"))
                            
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
                                            .font(.title3)
                                            .foregroundColor(Color("Blue3"))
                                        
                                    }
                                    .frame(width: 30, height: 30)
                                }
                                
                                Spacer()
                                
                                Text("QUIZZED")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
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
                                            .font(.title2)
                                            .bold()
                                            .foregroundColor(Color("Blue3"))
                                        
                                    }
                                    .frame(width: 30, height: 30)
                                }
                            }
                            .padding(.horizontal)
                            
                        }
                                                
                        // MARK: Select Category
                        Text("Select a category")
                            .font(.title2)
                            .padding(.top, 20)
                        
                        
                        // MARK: Categories
                        ScrollView(showsIndicators: false) {
                            
                            
                            LazyVGrid(columns: columns, spacing: 15) {
                                ForEach(categories, id: \.id) { item in
                                    
                                    NewCategoryButton(selectedCategory: $selectedCategory, category: item.category)
                                        .frame(width: screenSize().width / 2.3, height: screenSize().width / 4)
                                        .onTapGesture {
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
                                        }
                                }
                            }
                            .padding(.vertical)
                            
//                            ForEach(categories, id: \.id) { item in
//
//                                CategoryButton(selectedCategory: $selectedCategory, category: item.category)
//                                    .onTapGesture {
//                                        if selectedCategory == item.category {
//                                            withAnimation(.easeInOut) {
//                                                selectedCategory = ""
//                                            }
//                                        } else {
//                                            withAnimation(.easeInOut) {
//                                                selectedCategory = item.category
//                                            }
//                                        }
//                                        quizModel.categoryID = item.categoryID
//                                        quizModel.selectedCategory = item.category
//                                        print(selectedCategory)
//
//                                    }
//                                    .padding(5)
//                            }
                            
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: screenSize().height / 1.7)
                        .padding(.horizontal)
                        .padding(.top, 10)
                        
                        
                        Spacer()

                        // MARK: Next Button
                        
                        NavigationLink {
                            DifficultyView()
                            
                        } label: {
                            ZStack{
//
                                RoundedCornerShape(corners: [.topLeft, .topRight], radius: 25)
                                    .frame(height: screenSize().height / 9)
                                    .foregroundColor(Color("Red"))
                                
                                
                                Text("NEXT")
                                    .font(.largeTitle)
                                    .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                                    .padding(.bottom, 10)
                                
                            }
                            .opacity(selectedCategory != "" ? 1 : 0.4)
                            
                        }
                        .disabled(selectedCategory != "" ? false : true)

                        
                        
                    }
                    .ignoresSafeArea()
                    .foregroundColor(.white)
                    .background(Color("Blue1"))
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
    
    var rulesContent: some View {
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
            .frame(width: screenSize().width / 1.2, height: screenSize().height / 1.7)

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


