//
//  HomeView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 12/01/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selectedCategory = ""

    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            VStack {
                Text("Hello, World!")
                
                Text("g")
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(categories, id: \.id) { item in
                            
                            CategoryBlock(selectedCategory: $selectedCategory, category: item.category, image: item.image, color: "Green2")
                            
                        }
                        
                    }
                    .padding()
                }
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
