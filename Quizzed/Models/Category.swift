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
