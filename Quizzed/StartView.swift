//
//  ContentView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 09/01/2022.
//

import SwiftUI

struct StartView: View {
    
    @StateObject var quizModel = QuizViewModel()
    
    @State var endAnimation = false
    
    var body: some View {
        
        ZStack {
            
            
            SplashView(endAnimation: $endAnimation)
            
            CategoryView()
                .environmentObject(quizModel)
                .offset(y: endAnimation ? 0 : UIScreen.main.bounds.height)

        }
        

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
