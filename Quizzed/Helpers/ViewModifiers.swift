//
//  ViewModifiers.swift
//  Quizzed
//
//  Created by Aaron Johncock on 11/09/2022.
//

import SwiftUI

struct HeaderShapeModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
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
    
}
