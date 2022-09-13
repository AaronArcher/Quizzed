//
//  StatsViewModelNew.swift
//  Quizzed
//
//  Created by Aaron Johncock on 13/09/2022.
//

import Foundation

class StatsViewModelNew: ObservableObject {
    
    @Published var allStatsNew: [CategoryStat] = [
        CategoryStat(categoryName: "Film", score: 0, timesPlayed: 0, perfectRound: 0),
        CategoryStat(categoryName: "Music", score: 0, timesPlayed: 0, perfectRound: 0),
        CategoryStat(categoryName: "Television", score: 0, timesPlayed: 0, perfectRound: 0),
        CategoryStat(categoryName: "Video Games", score: 0, timesPlayed: 0, perfectRound: 0),
        CategoryStat(categoryName: "Science & Nature", score: 0, timesPlayed: 0, perfectRound: 0),
        CategoryStat(categoryName: "Mythology", score: 0, timesPlayed: 0, perfectRound: 0),
        CategoryStat(categoryName: "Animals", score: 0, timesPlayed: 0, perfectRound: 0),
        CategoryStat(categoryName: "Comics", score: 0, timesPlayed: 0, perfectRound: 0),
        CategoryStat(categoryName: "General Knowledge", score: 0, timesPlayed: 0, perfectRound: 0),
        CategoryStat(categoryName: "Sport", score: 0, timesPlayed: 0, perfectRound: 0)
    ]
    
}
