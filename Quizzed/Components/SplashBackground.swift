//
//  SplashBackground.swift
//  Quizzed
//
//  Created by Aaron Johncock on 04/06/2022.
//

import SwiftUI

struct SplashBackground: View {
    
    private var height = UIScreen.main.bounds.height
    @State private var reveal = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {

                Rectangle()
                    .fill(Color("Red"))
                    .frame(width: height * 2, height: height * 2)
                    .offset(y: reveal ? -height * 2 : 0)

                Rectangle()
                    .fill(Color("Red"))
                    .frame(width: height * 2, height: height * 2)
                    .offset(y: reveal ? height * 2 : 0)

            }
            .onAppear {
                withAnimation(.easeInOut(duration: 2)) {
                    reveal = true
                }
            }
            
        }
        .rotationEffect(.degrees(45))
        .ignoresSafeArea()
    }
}

struct SplashBackground_Previews: PreviewProvider {
    static var previews: some View {
        SplashBackground()
    }
}
