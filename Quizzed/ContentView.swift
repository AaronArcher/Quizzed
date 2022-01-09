//
//  ContentView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 09/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var endAnimation = false
    
    var body: some View {
        
        if endAnimation {
            Home()
        }
        else {
            SplashView(endAnimation: $endAnimation)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
