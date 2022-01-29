//
//  HomeView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 25/01/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var quizModel = QuizViewModel()
    
    @State private var selectedCategory = ""
    @State private var categoryImage = ""
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @State private var showRules = true
    
    var body: some View {
        
        ZStack {

        NavigationView {
                VStack(spacing: 0) {
                    
                    // MARK: Title Bar
                    ZStack {
                        
                        Rectangle()
                            .frame(maxWidth: .infinity)
                            .frame(height: screenHeight / 6)
                            .foregroundColor(Color("Red"))
                        
                            .mask(RoundedRectangle(cornerRadius: 25))
                            .offset(y: -20)
                        
                        HStack {
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                                
                                Image(systemName: "person.fill")
                                    .font(.title2)
                                    .foregroundColor(Color("Blue3"))
                                
                            }
                            .frame(width: 30, height: 30)
                            
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
                    
                    
                    // MARK: Categories
                    ScrollView(showsIndicators: false) {
                        
                        ForEach(categories, id: \.id) { item in
                            
                            CategoryButton(selectedCategory: $selectedCategory, icon: item.image, category: item.category)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        selectedCategory = item.category
                                        categoryImage = item.image
                                    }
                                    quizModel.categoryID = item.categoryID
                                    print(selectedCategory)

                                }
                                .padding(5)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: screenHeight / 1.6)
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    
                    Spacer()

                    // MARK: Next Button
                    
                    NavigationLink {
                        DifficultyView(selectedCategory: $selectedCategory, categoryImage: $categoryImage)
                            .environmentObject(quizModel)
                    } label: {
                        ZStack{
                            Rectangle()
                                .frame(maxWidth: .infinity)
                                .frame(height: screenHeight / 7)
                                .foregroundColor(Color("Red").opacity(1))
                            
                                .mask(RoundedRectangle(cornerRadius: 25))
                                .offset(y: 20)
                            
                            
                            Text("NEXT")
                                .font(.largeTitle)
                                .padding(.top, 15)
                                .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                            
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
                
                }
            
            // MARK: Rules
            if showRules {
                RulesView(showRules: $showRules)
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


