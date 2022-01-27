//
//  Home.swift
//  Quizzed
//
//  Created by Aaron Johncock on 09/01/2022.
//

import SwiftUI

struct CategoryView: View {
    
    @StateObject var quizModel = QuizViewModel()

    let columns = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)
    ]
        
    @State private var selectedCategory = ""
    
    var body: some View {
       
        NavigationView {
           
                VStack(spacing: 10) {
                    Text("QUIZZED")
                        .foregroundColor(Color("Green3"))
                        .font(.system(size: 45, weight: .bold))
                        .padding(.top, 10)
                    
                    Text("SELECT A CATEGORY")
                        .foregroundColor(Color("Green3"))
                        .font(.title2)
                        .fontWeight(.light)

                    
                    // Category Blocks
                    
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: columns, spacing: 5) {
                            ForEach(categories, id: \.id) { item in
                                
                                CategoryBlock(selectedCategory: $selectedCategory, category: item.category, image: item.image)
                                    .onTapGesture {
                                        withAnimation(.easeInOut) {
                                            selectedCategory = item.category
                                        }
                                        quizModel.categoryID = item.categoryID
                                        print(selectedCategory)
                                    }
                            }
                            
                        }
                    }
                    .padding(.horizontal,10)
                    .frame(maxHeight: 544)
                    
                    Spacer()
                    
                    NavigationLink {
                        DifficultyView(selectedCategory: $selectedCategory)
                            .environmentObject(quizModel)

                        
                    } label: {
                        
                        HStack(spacing: 0) {
                            Spacer()
                            
                            Text("NEXT")
                                .font(.title)
                                .fontWeight(.light)
                                
                            Image(systemName: "arrow.right")
                                .font(.system(size: 30, weight: .light))
                                .padding(.horizontal)
                                
                        }
                        .foregroundColor(Color("Green3"))
                    }
                    .disabled(selectedCategory.isEmpty ? true : false)

                    Spacer()
                }
                .background(
                    Color("Background")
                )
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                
        }
        
    
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
            .environmentObject(QuizViewModel())
    }
}

struct CategoryBlock: View {
    
    @State var selected: Bool = false
    @Binding var selectedCategory: String
        
    var category: String
    var image: String
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            
            Rectangle()
                .stroke(Color("Green3"), lineWidth: 1)
            
            VStack(spacing: 0) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    
                Text(category.uppercased())
                    .font(.body)
                    .fontWeight(.light)
                    .padding(.top, 10)
                    .padding(.bottom, 3)
               
                

                
                    
            }
            .foregroundColor(.white)
            
           
            Group {
                ClickShape1()
                    .trim(from: 0, to: selectedCategory == category ? 1 : 0)
                    .stroke(.white, lineWidth: 1.5)
                
                ClickShape2()
                    .trim(from: 0, to: selectedCategory == category ? 1 : 0)
                    .stroke(.white, lineWidth: 1.5)
                
                ClickShape3()
                    .trim(from: 0, to: selectedCategory == category ? 1 : 0)
                    .stroke(.white, lineWidth: 1.5)
                
                ClickShape4()
                    .trim(from: 0, to: selectedCategory == category ? 1 : 0)
                    .stroke(.white, lineWidth: 1.5)
            }
                
            
        }
        .frame(height: 130)

        
    }
}


struct ClickShape1: Shape {
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            
            path.move(to: CGPoint(x: rect.minX + 7, y: rect.minY + 7))
            path.addLine(to: CGPoint(x: rect.maxX - 20, y: rect.minY + 7))
            
        }
    }
}

struct ClickShape2: Shape {
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            
            path.move(to: CGPoint(x: rect.minX + 7, y: rect.minY + 7))
            path.addLine(to: CGPoint(x: rect.minX + 7, y: rect.maxY - 20))
            
        }
    }
}

struct ClickShape3: Shape {
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            
            path.move(to: CGPoint(x: rect.maxX - 7, y: rect.maxY - 7))
            path.addLine(to: CGPoint(x: rect.maxX - 7, y: rect.minY + 20))
            
        }
    }
}

struct ClickShape4: Shape {
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            
            path.move(to: CGPoint(x: rect.maxX - 7, y: rect.maxY - 7))
            path.addLine(to: CGPoint(x: rect.minX + 20, y: rect.maxY - 7))
            
        }
    }
}
