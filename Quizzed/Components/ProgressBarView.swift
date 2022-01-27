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
                .frame(height: 2)
                .foregroundColor(.white)
                .cornerRadius(5)
            
            Rectangle()
                .frame(width: progress, height: 4)
                .animation(.easeInOut, value: progress)
                .foregroundColor(Color("Red"))
                .cornerRadius(10)
        }

    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(progress: 50)
    }
}
