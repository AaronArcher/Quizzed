//
//  Constants.swift
//  Quizzed
//
//  Created by Aaron Johncock on 07/06/2022.
//

import Foundation
import SwiftUI

enum ScreenOptions {
    
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

enum Categories {
    
    static let animals = "Animals"
    static let comics = "Comics"
    static let film = "Film"
    static let generalKnowledge = "General Knowledge"
    static let music = "Music"
    static let mythology = "Mythology"
    static let television = "Television"
    static let scienceAndNature = "Science & Nature"
    static let sport = "Sport"
    static let videoGames = "Video Games"
}
