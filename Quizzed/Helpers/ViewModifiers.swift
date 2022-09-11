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

struct BottomButtonModifier: ViewModifier {
    
    var isActive: Bool
    
    func body(content: Content) -> some View {
        content
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
            .opacity(isActive ? 1 : 0.4)
    }
}
