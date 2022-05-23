//
//  CategoryButton.swift
//  Quizzed
//
//  Created by Aaron Johncock on 25/01/2022.
//

import SwiftUI

struct CategoryButton: View {
    
    @Binding var selectedCategory: String
    
    var category: String = "Animals"

    var body: some View {
        
        
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("Blue3"))
//                    .shadow(color: selectedCategory == category ? .clear : Color("Blue3"), radius: 3, x: 3, y: 3)
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("Red"))
                    .frame(height: 60)
                    .frame(maxWidth: selectedCategory == category ? .infinity : 60)
//                    .shadow(color: selectedCategory == category ? Color("Red") : .clear, radius: 3, x: 3, y: 3)

                HStack {
                    
                        Image(category)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                    


                    Text(category)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.leading, 10)
                    
                    Spacer()
                }
                .padding(.leading, 5)
                

            }
            .frame(height: 60)
        
        
    }
}

struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButton(selectedCategory: .constant(""))
    }
}
