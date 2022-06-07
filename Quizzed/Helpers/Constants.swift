//
//  Constants.swift
//  Quizzed
//
//  Created by Aaron Johncock on 07/06/2022.
//

import Foundation
import SwiftUI

struct Constants {
    
    static var isScreenLarge: Bool {
        UIScreen.main.bounds.height > 680
    }
    
    static func headerPadding() -> Double {
        if isScreenLarge {
            return 45
        } else {
            return 25
        }
    }
    
    static func bottomButtonPadding() -> Double {
        if isScreenLarge {
            return 25
        } else {
            return 15
        }
    }
    
    
}
