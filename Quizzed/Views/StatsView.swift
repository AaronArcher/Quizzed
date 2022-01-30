//
//  StatsView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 29/01/2022.
//

import SwiftUI

struct StatsView: View {
    
    @Binding var showStats: Bool
    
    var body: some View {
        ZStack {
            Button("Close"){
                withAnimation {
                    showStats.toggle()

                }
            }
            .foregroundColor(.white)
        }
        .frame(width: screenSize().width - 90)
        .frame(maxHeight: .infinity)
        .background(Color("Blue3"))
        .frame(maxWidth: .infinity, alignment: .leading)

    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(showStats: .constant(true))
    }
}
