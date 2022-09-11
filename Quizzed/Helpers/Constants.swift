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

enum Backgrounds {
    static let gradient = LinearGradient(colors: [Color("Blue1"), Color("Blue1"), Color("Blue2"), Color("Blue1"), Color("Blue1")], startPoint: .top, endPoint: .bottom)
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
    
    static let allCategories = [

        Category(category: Categories.animals, image: Categories.animals, categoryID: "27"),
        Category(category: Categories.comics, image: Categories.comics, categoryID: "29"),
        Category(category: Categories.film, image: Categories.film, categoryID: "11"),
        Category(category: Categories.generalKnowledge, image: Categories.generalKnowledge, categoryID: "9"),
        Category(category: Categories.music, image: Categories.music, categoryID: "12"),
        Category(category: Categories.mythology, image: Categories.mythology, categoryID: "20"),
        Category(category: Categories.television, image: Categories.television, categoryID: "14"),
        Category(category: Categories.scienceAndNature, image: Categories.scienceAndNature, categoryID: "17"),
        Category(category: Categories.sport, image: Categories.sport, categoryID: "21"),
        Category(category: Categories.videoGames, image: Categories.videoGames, categoryID: "15")

    ]
    
}
