//
//  HeaderButton.swift
//  Quizzed
//
//  Created by Aaron Johncock on 11/09/2022.
//

import SwiftUI

struct HeaderButton: View {
        
    var body: some View {
        
            RoundedRectangle(cornerRadius: 5)
                .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
        
    }
}

struct HeaderButton_Previews: PreviewProvider {
    static var previews: some View {
        HeaderButton()
    }
}
