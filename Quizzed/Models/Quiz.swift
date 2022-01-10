//
//  Quiz.swift
//  Quizzed
//
//  Created by Aaron Johncock on 10/01/2022.
//

import Foundation

struct Quiz: Decodable {
    
    var results: [Result]
    
    struct Result: Decodable, Identifiable {
        var id: UUID {
            UUID()
        }
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correctAnswer: String
        var incorrectAnswers: [String]
        
        var formattedQuestion: AttributedString {
            do {
                return try AttributedString(markdown: question)
            } catch {
                print("Error setting Formatted Question: \(error)")
                return ""
            }
        }
        
        var answers: [Answer] {
            do {
                let correct = [Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
                let incorrect = try incorrectAnswers.map { answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                }
                
                let allAnswers = correct + incorrect
                
                return allAnswers.shuffled()
            } catch {
                print("Error setting Answers: \(error)")
                return []
            }
        }
        
        
    }
    
}
