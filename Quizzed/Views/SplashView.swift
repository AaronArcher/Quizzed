//
//  SplashView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 09/01/2022.
//

import SwiftUI

struct SplashView: View {
    
    @State private var startAnimation = false
    @State private var lineAnimation = false
    @State private var screenAnimation = false
    @Binding var endAnimation: Bool
    
    var body: some View {
        
        ZStack {

            Color("Red")
            
            Circle()
                .rotation(Angle(degrees: -90))
                .trim(from: 0, to: startAnimation ? 1 : 0)
                .stroke(
                    Color("Blue1")
                    , style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .frame(width: 200, height: 200)
            
            RoundedRectangle(cornerRadius: 15)
                .rotation(Angle(degrees: 45))
                .offset(x: 70, y: 70)
                .fill(Color("Blue1"))
                .frame(width: lineAnimation ? 100 : 0, height: 20)
            
            Rectangle()
                .rotation(Angle(degrees: 45))
                .fill(Color("Blue1"))
                .frame(width: 900, height: screenAnimation ? 1000 : 0)
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
            
            VStack {
                
                Spacer()
                
                Text("Powered By")
                    .font(.subheadline)
                    .foregroundColor(Color("Blue1"))
                
                Text("Open Trivia Database")
                    .font(.caption)
                    .foregroundColor(Color("Blue1"))

                
            }
            .padding(.bottom, 60)
            .frame(height: UIScreen.main.bounds.height)
            .foregroundColor(Color("Background"))
            
        }
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.easeInOut(duration: 0.75).delay(0.25)) {
                startAnimation = true
            }
            
            withAnimation(.easeInOut(duration: 0.5).delay(1)) {
                lineAnimation = true
            }
            
            withAnimation(.easeIn(duration: 0.75).delay(2.5)) {
                screenAnimation = true
            }
            
            withAnimation(.spring().delay(3.5)) {
                endAnimation = true
            }
            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
//                endAnimation = true
//            }
            
        }
    
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

