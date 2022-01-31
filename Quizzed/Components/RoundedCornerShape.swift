//
//  RoundedCornerShape.swift
//  Quizzed
//
//  Created by Aaron Johncock on 31/01/2022.
//

import SwiftUI

struct RoundedCornerShape: Shape {
 
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
    
}
