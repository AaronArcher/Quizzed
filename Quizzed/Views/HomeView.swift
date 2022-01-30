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

    
    @State private var showRules = false
    @Binding var showStats: Bool

    
    var body: some View {
        

            NavigationView {
                    VStack(spacing: 0) {
                        
                        // MARK: Title Bar
                        ZStack {
                            
                            Rectangle()
                                .frame(maxWidth: .infinity)
                                .frame(height: screenSize().height / 6)
                                .foregroundColor(Color("Red"))
                            
                                .mask(RoundedRectangle(cornerRadius: 25))
                                .offset(y: -20)
                            
                            HStack {
                                
                                Button {
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.5)) {
                                        showStats.toggle()
                                    }
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                                        
                                        Image(systemName: "person.fill")
                                            .font(.title2)
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
                        .frame(height: screenSize().height / 1.6)
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
                                    .frame(height: screenSize().height / 7)
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
                    .rulesPopup(show: $showRules) {
                        rulesContent
                    }
                    
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showStats: .constant(false))
            .environmentObject(QuizViewModel())

    }
}


