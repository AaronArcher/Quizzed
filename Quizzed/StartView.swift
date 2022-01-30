//
//  ContentView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 09/01/2022.
//

import SwiftUI


struct StartView: View {
    

    
    @State var endAnimation = false
    
    var body: some View {
        

            ZStack {
          
//                if !endAnimation {
//                    SplashView(endAnimation: $endAnimation)
//
//                } else {
//                    HomeHolderView()
//                        .transition(.move(edge: .trailing))
//
//                }
                SplashView(endAnimation: $endAnimation)
                    .zIndex(!endAnimation ? 1 : 0)
    
    
                HomeHolderView()
                    .offset(x: endAnimation ? 0 : -screenSize().width)
            }
        
        

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .environmentObject(QuizViewModel())

    }
}

// MARK: Extension to get screen size
extension View {
    func screenSize() -> CGRect {
        return UIScreen.main.bounds
    }
}
