//
//  ProgressView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 10/01/2022.
//

import SwiftUI

struct ProgressBarView: View {
    
    
    var progress: CGFloat
    
    var body: some View {

        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: 350, maxHeight: 4)
                .foregroundColor(Color("Green2"))
                .cornerRadius(10)
            
            Rectangle()
                .frame(width: progress, height: 5)
                .animation(.easeInOut, value: progress)
                .foregroundColor(Color("Background"))
                .cornerRadius(10)
        }

    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(progress: 50)
    }
}
