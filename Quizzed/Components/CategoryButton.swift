//
//  NewCategoryView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 23/05/2022.
//

import SwiftUI

struct CategoryButton: View {
    
    @Environment(\.dynamicTypeSize) var typeSize
    
    @Binding var selectedCategory: String    
    var category: String = "Animals"
        
    var body: some View {
        
        GeometryReader { geo in
            
            let width = geo.size.width
            let height = geo.size.height
            
            ZStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color("Blue3"))
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color("Blue2"), lineWidth: 15)
                        .blur(radius: 20)
                }
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color("Red"))
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color("Red2").opacity(0.5), lineWidth: 25)
                        .blur(radius: 20)
                    
                }
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .frame(width: selectedCategory == category ? width : 0, height: selectedCategory == category ? height : 0)
                
                VStack {
                        
                    Spacer()
                    
                    Image(category)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: typeSize > .large ? width / 3 : width / 3.8, height: typeSize > .large ? width / 3 : width / 3.8)
                    
                    Spacer()
                    
                    Text(category)
                        .font(.callout)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                    
                    Spacer()
                }
                .padding(.horizontal, 5)
            }
            .foregroundColor(.white)
            
        }
        .frame(width: screenSize().width / 2.3, height: typeSize > .large ? 135 : 100)
        
    }
}

struct NewCategoryView_Previews: PreviewProvider {

    static var previews: some View {
        CategoryButton(selectedCategory: .constant(""))
    }
}
