//
//  Stats.swift
//  Quizzed
//
//  Created by Aaron Johncock on 22/05/2022.
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
    @Published var film = CategoryStat(categoryName: "Film", score: 0, timesPlayed: 0, perfectRound: 0) {
        didSet {
            if let encoded = try? JSONEncoder().encode(film) {
                UserDefaults.standard.set(encoded, forKey: "filmStat")
            }
        }
    }
    @Published var music = CategoryStat(categoryName: "Music", score: 0, timesPlayed: 0, perfectRound: 0) {
        didSet {
            if let encoded = try? JSONEncoder().encode(music) {
                UserDefaults.standard.set(encoded, forKey: "musicStat")
            }
        }
    }
    @Published var television = CategoryStat(categoryName: "Television", score: 0, timesPlayed: 0, perfectRound: 0) {
        didSet {
            if let encoded = try? JSONEncoder().encode(television) {
                UserDefaults.standard.set(encoded, forKey: "televisionStat")
            }
        }
    }
    @Published var videoGames = CategoryStat(categoryName: "Video Games", score: 0, timesPlayed: 0, perfectRound: 0) {
        didSet {
            if let encoded = try? JSONEncoder().encode(videoGames) {
                UserDefaults.standard.set(encoded, forKey: "videoGamesStat")
            }
        }
    }
    @Published var scienceAndNature = CategoryStat(categoryName: "Science & Nature", score: 0, timesPlayed: 0, perfectRound: 0) {
        didSet {
            if let encoded = try? JSONEncoder().encode(scienceAndNature) {
                UserDefaults.standard.set(encoded, forKey: "scienceStat")
            }
        }
    }
    @Published var mythology = CategoryStat(categoryName: "Mythology", score: 0, timesPlayed: 0, perfectRound: 0) {
        didSet {
            if let encoded = try? JSONEncoder().encode(mythology) {
                UserDefaults.standard.set(encoded, forKey: "mythologyStat")
            }
        }
    }
    @Published var animals = CategoryStat(categoryName: "Animals", score: 0, timesPlayed: 0, perfectRound: 0) {
        didSet {
            if let encoded = try? JSONEncoder().encode(animals) {
                UserDefaults.standard.set(encoded, forKey: "animalsStat")
            }
        }
    }
    @Published var comics = CategoryStat(categoryName: "Comics", score: 0, timesPlayed: 0, perfectRound: 0) {
        didSet {
            if let encoded = try? JSONEncoder().encode(comics) {
                UserDefaults.standard.set(encoded, forKey: "comicsStat")
            }
        }
    }
    @Published var generalKnowledge = CategoryStat(categoryName: "General Knowledge", score: 0, timesPlayed: 0, perfectRound: 0) {
        didSet {
            if let encoded = try? JSONEncoder().encode(generalKnowledge) {
                UserDefaults.standard.set(encoded, forKey: "generalStat")
            }
        }
    }
    @Published var sport = CategoryStat(categoryName: "Sport", score: 0, timesPlayed: 0, perfectRound: 0) {
        didSet {
            if let encoded = try? JSONEncoder().encode(sport) {
                UserDefaults.standard.set(encoded, forKey: "sportStat")
            }
        }
    }
    
    
    func bestCategory() -> CategoryStat {
        let allCategories = [film, music, television, videoGames, scienceAndNature, mythology, animals, comics, sport, generalKnowledge]
        let sortedCategories = allCategories.sorted()
        return sortedCategories[0]
    }
    func allCategories() -> [CategoryStat] {
        let allCategories = [film, music, television, videoGames, scienceAndNature, mythology, animals, comics, sport, generalKnowledge]
        return allCategories.sorted()
    }
    
    func resetData() {

        gamesPlayed = 0
        totalScore = 0
        perfectRounds = 0
        
        film.score = 0
        film.timesPlayed = 0
        film.perfectRound = 0
        music.score = 0
        music.timesPlayed = 0
        music.perfectRound = 0
        television.score = 0
        television.timesPlayed = 0
        television.perfectRound = 0
        videoGames.score = 0
        videoGames.timesPlayed = 0
        videoGames.perfectRound = 0
        scienceAndNature.score = 0
        scienceAndNature.timesPlayed = 0
        scienceAndNature.perfectRound = 0
        mythology.score = 0
        mythology.timesPlayed = 0
        mythology.perfectRound = 0
        animals.score = 0
        animals.timesPlayed = 0
        animals.perfectRound = 0
        comics.score = 0
        comics.timesPlayed = 0
        comics.perfectRound = 0
    }

    init() {
        
        gamesPlayed = UserDefaults.standard.integer(forKey: "gamesPlayed")
        totalScore = UserDefaults.standard.integer(forKey: "totalScore")
        perfectRounds = UserDefaults.standard.integer(forKey: "perfectRounds")
        
        if let filmStat = UserDefaults.standard.data(forKey: "filmStat") {
            if let decodedItems = try? JSONDecoder().decode(CategoryStat.self, from: filmStat) {
                film = decodedItems
            }
        }
        
        if let musicStat = UserDefaults.standard.data(forKey: "musicStat") {
            if let decodedItems = try? JSONDecoder().decode(CategoryStat.self, from: musicStat) {
                music = decodedItems
            }
        }
        
        if let televisionStat = UserDefaults.standard.data(forKey: "televisionStat") {
            if let decodedItems = try? JSONDecoder().decode(CategoryStat.self, from: televisionStat) {
                television = decodedItems
            }
        }
        
        if let videoGamesStat = UserDefaults.standard.data(forKey: "videoGamesStat") {
            if let decodedItems = try? JSONDecoder().decode(CategoryStat.self, from: videoGamesStat) {
                videoGames = decodedItems
            }
        }
        
        if let scienceStat = UserDefaults.standard.data(forKey: "scienceStat") {
            if let decodedItems = try? JSONDecoder().decode(CategoryStat.self, from: scienceStat) {
                scienceAndNature = decodedItems
            }
        }
        
        if let mythologyStat = UserDefaults.standard.data(forKey: "mythologyStat") {
            if let decodedItems = try? JSONDecoder().decode(CategoryStat.self, from: mythologyStat) {
                mythology = decodedItems
            }
        }
        
        if let animalsStat = UserDefaults.standard.data(forKey: "animalsStat") {
            if let decodedItems = try? JSONDecoder().decode(CategoryStat.self, from: animalsStat) {
                animals = decodedItems
            }
        }
        
        if let comicsStat = UserDefaults.standard.data(forKey: "comicsStat") {
            if let decodedItems = try? JSONDecoder().decode(CategoryStat.self, from: comicsStat) {
                comics = decodedItems
            }
        }
        
        if let generalStat = UserDefaults.standard.data(forKey: "generalStat") {
            if let decodedItems = try? JSONDecoder().decode(CategoryStat.self, from: generalStat) {
                generalKnowledge = decodedItems
            }
        }
        
        if let sportStat = UserDefaults.standard.data(forKey: "sportStat") {
            if let decodedItems = try? JSONDecoder().decode(CategoryStat.self, from: sportStat) {
                sport = decodedItems
            }
        }
                
    }

}

struct CategoryStat: Comparable, Codable, Hashable {
    static func < (lhs: CategoryStat, rhs: CategoryStat) -> Bool {
        return lhs.score > rhs.score
    }
    
    var categoryName: String
    var score: Int
    var timesPlayed: Int
    var perfectRound: Int
}
