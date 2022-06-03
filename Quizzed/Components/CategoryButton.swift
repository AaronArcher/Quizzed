//
//  NewCategoryView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 23/05/2022.
//

import SwiftUI

struct CategoryButton: View {
    
    @Binding var selectedCategory: String    
    var category: String = "Animals"
        
    var body: some View {
        
        GeometryReader { geo in
            
            let width = geo.size.width
            let height = geo.size.height
            
            ZStack() {
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
                        .stroke(Color("Blue2").opacity(0.5), lineWidth: 15)
                        .blur(radius: 20)
                    
                }
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .frame(width: selectedCategory == category ? width : 0, height: selectedCategory == category ? height : 0)
                
                VStack {
                        
                    Spacer()
                    
                    Image(category)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width / 4, height: geo.size.width / 4)
                    
                    Spacer()
                    
                    Text(category)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
                .padding(.horizontal, 5)
            }
            .foregroundColor(.white)
            
        }
        
    }
}

struct NewCategoryView_Previews: PreviewProvider {

    static var previews: some View {
        CategoryButton(selectedCategory: .constant(""))
    }
}
