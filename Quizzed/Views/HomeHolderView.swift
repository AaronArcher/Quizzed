//
//  Test.swift
//  Quizzed
//
//  Created by Aaron Johncock on 29/01/2022.
//

import SwiftUI

struct HomeHolderView: View {
    
    @StateObject var quizModel = QuizViewModel()
    
    @State var showStats = false
    
    
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
