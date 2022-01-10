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
}

var categories = [

    Category(category: "Film", image: "Film", color: "Yellow"),
    Category(category: "Music", image: "Music", color: "Blue"),
    Category(category: "Television", image: "TV", color: "Blue"),
    Category(category: "Video Games", image: "Video Games", color: "Yellow"),
    Category(category: "Science & Nature", image: "Science&Nature", color: "Yellow"),
    Category(category: "Mythology", image: "Mythology", color: "Blue"),
    Category(category: "Animals", image: "Animals", color: "Blue"),
    Category(category: "Comics", image: "Comics", color: "Yellow")

]
