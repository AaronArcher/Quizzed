//
//  CategoryStat.swift
//  Quizzed
//
//  Created by Aaron Johncock on 11/09/2022.
//

import Foundation

struct CategoryStat: Comparable, Codable, Hashable {
    static func < (lhs: CategoryStat, rhs: CategoryStat) -> Bool {
        return lhs.score > rhs.score
    }
    
    var categoryName: String
    var score: Int
    var timesPlayed: Int
    var perfectRound: Int
}
