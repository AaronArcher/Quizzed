//
//  Category.swift
//  Quizzed
//
//  Created by Aaron Johncock on 09/01/2022.
//

import Foundation

struct Category: Identifiable {
    let id = UUID()
    let category: String
    let image: String
    let categoryID: String
}

var categories = [

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
