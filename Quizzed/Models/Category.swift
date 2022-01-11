//
//  Category.swift
//  Quizzed
//
//  Created by Aaron Johncock on 09/01/2022.
//

import Foundation

struct Category: Identifiable {
    var id = UUID()
    var category: String
    var image: String
    var color: String
    var categoryID: String
}

var categories = [

    Category(category: "Film", image: "Film", color: "Yellow", categoryID: "11"),
    Category(category: "Music", image: "Music", color: "Blue", categoryID: "12"),
    Category(category: "Television", image: "TV", color: "Blue", categoryID: "14"),
    Category(category: "Video Games", image: "Video Games", color: "Yellow", categoryID: "15"),
    Category(category: "Science & Nature", image: "Science&Nature", color: "Yellow", categoryID: "17"),
    Category(category: "Mythology", image: "Mythology", color: "Blue", categoryID: "20"),
    Category(category: "Animals", image: "Animals", color: "Blue", categoryID: "27"),
    Category(category: "Comics", image: "Comics", color: "Yellow", categoryID: "29")

]
