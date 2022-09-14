//
//  StatsViewModelNew.swift
//  Quizzed
//
//  Created by Aaron Johncock on 13/09/2022.
//

import Foundation

class StatsViewModel: ObservableObject {
    
    @Published var gamesPlayed = 0 {
        didSet {
            UserDefaults.standard.set(gamesPlayed, forKey: "gamesPlayed")
        }
    }
    @Published var totalScore = 0 {
        didSet {
            UserDefaults.standard.set(totalScore, forKey: "totalScore")
        }
    }
    @Published var perfectRounds = 0 {
        didSet {
            UserDefaults.standard.set(perfectRounds, forKey: "perfectRounds")
        }
    }
    
    @Published var allStats: [CategoryStat] = [
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
    ] {
        didSet {
            if let encoded = try? JSONEncoder().encode(allStats) {
                UserDefaults.standard.set(encoded, forKey: "allStats")
            }
        }
    }
    
    func updateStat(category: String, score: Int, perfectRound: Bool) {
        
        gamesPlayed += 1
        totalScore += score
        if perfectRound {
            perfectRounds += 1
        }
        
        if let index = allStats.firstIndex(where: { $0.categoryName == category }) {
            allStats[index].score += score
            allStats[index].timesPlayed += 1
            if perfectRound {
                allStats[index].perfectRound += 1
            }
        }
    }
    
    func resetData() {
        gamesPlayed = 0
        totalScore = 0
        perfectRounds = 0
        
        allStats = [
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
    
    func bestCategory() -> CategoryStat {
        let sortedCategories = allStats.sorted()
        return sortedCategories[0]
        
    }
    
    init() {
        gamesPlayed = UserDefaults.standard.integer(forKey: "gamesPlayed")
        totalScore = UserDefaults.standard.integer(forKey: "totalScore")
        perfectRounds = UserDefaults.standard.integer(forKey: "perfectRounds")
        
        if let allStatsData = UserDefaults.standard.data(forKey: "allStats") {
            if let decoded = try? JSONDecoder().decode([CategoryStat].self, from: allStatsData) {
                allStats = decoded
            }
        }
        
    }
    
}
