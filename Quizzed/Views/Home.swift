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
       
        ZStack {
            
            Color("Purple")
            
            VStack(spacing: 20) {
                Text("QUIZZED")
                    .foregroundColor(Color("Yellow"))
                    .font(.system(size: 45, weight: .bold))
                .padding(.top, 50)
                
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
                .frame(maxHeight: 540)
                
                Button {
                    
                } label: {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 200, height: 50)
                            .foregroundColor(Color("Orange"))
                            .shadow(color: Color("Orange"), radius: 3, x: 0, y: 0)
                        
                        Text("NEXT")
                            .font(.title)
                            .foregroundColor(Color("Purple"))
                    }
                    
                }

                
                Spacer()
            }

        }
        .ignoresSafeArea()
    
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
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                ClickShape2()
                    .trim(from: 0, to: selectedCategory == category ? 1 : 0)
                    .stroke(.white, lineWidth: 1.5)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                ClickShape3()
                    .trim(from: 0, to: selectedCategory == category ? 1 : 0)
                    .stroke(.white, lineWidth: 1.5)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                ClickShape4()
                    .trim(from: 0, to: selectedCategory == category ? 1 : 0)
                    .stroke(.white, lineWidth: 1.5)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
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
