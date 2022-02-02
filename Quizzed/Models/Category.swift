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
    var categoryID: String
}

var categories = [

    Category(category: "Film", image: "Film", categoryID: "11"),
    Category(category: "Music", image: "Music", categoryID: "12"),
    Category(category: "Television", image: "Television", categoryID: "14"),
    Category(category: "Video Games", image: "Video Games", categoryID: "15"),
    Category(category: "Science & Nature", image: "Science & Nature", categoryID: "17"),
    Category(category: "Mythology", image: "Mythology", categoryID: "20"),
    Category(category: "Animals", image: "Animals", categoryID: "27"),
    Category(category: "Comics", image: "Comics", categoryID: "29")

]
