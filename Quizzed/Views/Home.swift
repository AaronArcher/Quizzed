//
//  Home.swift
//  Quizzed
//
//  Created by Aaron Johncock on 09/01/2022.
//

import SwiftUI

struct Home: View {
    
    
    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
        
    @State private var selectedCategory = ""
    
    var body: some View {
       
        NavigationView {
            ZStack(alignment: .top) {
                
                Color("Purple")
                
                VStack(spacing: 20) {
                    Text("QUIZZED")
                        .foregroundColor(Color("Yellow"))
                        .font(.system(size: 45, weight: .bold))
                        .padding(.top, 40)
                    
                    Text("SELECT A CATEGORY")
                        .foregroundColor(Color("Orange"))
                        .font(.title2)
                        .fontWeight(.light)

                    
                    // Category Blocks
                    
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: columns, spacing: 0) {
                            ForEach(categories, id: \.id) { item in
                                
                                CategoryBlock(selectedCategory: $selectedCategory, category: item.category, image: item.image, color: item.color)
                                    .onTapGesture {
                                        withAnimation(.easeInOut) {
                                            selectedCategory = item.category
                                        }
                                        print(selectedCategory)
                                    }
                                    
                                
                            }
                            
                        }
                    }
                    .frame(maxHeight: 520)
                    
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 1)
                        .foregroundColor(.clear)
                    
                    NavigationLink {
                        DifficultyView(selectedCategory: $selectedCategory)
                        
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
                        .foregroundColor(Color("Orange"))
                    }
                    .disabled(selectedCategory.isEmpty ? true : false)

                    
                }
                .frame(maxHeight: .infinity)
            }
            .ignoresSafeArea()
        }
        
    
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct CategoryBlock: View {
    
    @State var selected: Bool = false
    @Binding var selectedCategory: String
        
    var category: String
    var image: String
    var color: String
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color(color))
            
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
