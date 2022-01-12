//
//  QShape.swift
//  Quizzed
//
//  Created by Aaron Johncock on 12/01/2022.
//

import SwiftUI

struct QShape: View {
        
    var body: some View {

        ZStack{
            
            Circle()
                .stroke(lineWidth: 6)
            
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 60, height: 6)
                .rotationEffect(Angle(degrees: 45))
                .offset(x: 35, y: 35)
        }
        .frame(width: 100, height: 100)

    }
}

struct QShape_Previews: PreviewProvider {
    static var previews: some View {
        QShape()
    }
}
