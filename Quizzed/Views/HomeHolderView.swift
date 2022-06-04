//
//  Test.swift
//  Quizzed
//
//  Created by Aaron Johncock on 29/01/2022.
//

import SwiftUI

// Keep HomeHolderView in rather than going straight to the Homeview so I only have to inject quizmodel once rather than to each child view...

struct HomeHolderView: View {
    
    @StateObject var quizModel = QuizViewModel()
    
    var body: some View {

            
            HomeView()
                .environmentObject(quizModel)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
           

    }
}

struct HomeHolderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHolderView()
    }
}
