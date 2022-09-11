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
                        
                        // MARK: Header
                           header
                                                
                        // MARK: Select Category
                        Text("Select a category")
                            .font(.title2)
                            .padding(.top, 20)
                        
                        // MARK: Categories
                        categoriesContent
                        
                        Spacer()

                        // MARK: Next Button
                        nextButton
                        
                    }
                    .ignoresSafeArea()
                    .foregroundColor(.white)
                    .background(
                        Backgrounds.gradient
                    )
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    .rulesPopup(show: $showRules) {
                        RulesPopup(showRules: $showRules)
                    }
                    .overlay(
                        showStats ?  StatsView(showStats: $showStats.animation()) : nil
                    )
                    
            }

        
    }
    
    var header: some View {
        HStack {
            
            Button {
                withAnimation {
                    showStats.toggle()
                }
            } label: {
                ZStack {
                    HeaderButton()
                    
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
                    HeaderButton()
                    
                    Text("?")
                        .font(.title.bold()).dynamicTypeSize(.medium)
                        .foregroundColor(Color("Blue3"))
                        .accessibilityLabel("Help and rules")
                    
                }
                .frame(width: 32, height: 32)
            }
        }
        .padding(.horizontal)
        .padding(.top, ScreenOptions.headerPadding())
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
    }
    
    var categoriesContent: some View {
        ScrollView(showsIndicators: false) {
            
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(Categories.allCategories, id: \.id) { item in
                    
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

                }
            }
            .padding(.vertical)
            
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: ScreenOptions.isScreenLarge ? 600 : 430)
        .padding(.horizontal)
        .padding(.top, 10)
    }
    
    var nextButton: some View {
        NavigationLink {
            DifficultyView()

        } label: {

            Text("NEXT")
                .font(.largeTitle)
                .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                .frame(maxWidth: .infinity)
                .padding(.bottom, ScreenOptions.bottomButtonPadding())
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
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(QuizViewModel())

    }
}
