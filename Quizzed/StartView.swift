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
    
                HomeHolderView()
                
                if !endAnimation {
                    SplashView(endAnimation: $endAnimation)
                        .ignoresSafeArea()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                                endAnimation = true
                            }
                        }
                }

                
            }
            .ignoresSafeArea()
        
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
