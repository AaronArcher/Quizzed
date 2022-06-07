//
//  QuizViewModel.swift
//  Quizzed
//
//  Created by Aaron Johncock on 10/01/2022.
//

import Foundation
import SwiftUI

class QuizViewModel: ObservableObject {
    
    var quiz: [Quiz.Result] = []
    @Published var length = 0
    @Published var index = 0
    @Published var reachedEnd = false
    @Published var answerSelected = false
    @Published var question: AttributedString = ""
    @Published var answerChoices: [Answer] = []
    @Published var progress: CGFloat = 0
    @Published var score = 0
    @Published var configuredScore = 0
    @Published var showCorrect = false
    @Published var showNext = false
    
    @Published var categoryID = "20"
    @Published var difficulty = "easy"
    @Published var selectedCategory = "Animals"
    
 
    

    // User Main Actor as this function is Asynchronous so will be performed on a background thread including any updates that may change the UI so marking this with Main Actor ensure UI changes are performed on the main thread
        @MainActor
        func fetchQuiz() async throws {
            
            // reset quiz data - if a user switches between quiz categories for example and then loses connection, it will show their previous questions.
            quiz = []
            
            let urlString = "https://opentdb.com/api.php?amount=10&category=\(categoryID)&difficulty=\(difficulty)"
            if let url = URL(string: urlString) {
                                
                do {
                    let (data, response) = try await URLSession.shared.data(from: url)

                    guard let response = response as? HTTPURLResponse,
                          response.statusCode >= 200 && response.statusCode <= 299 else {
                        throw QuizError.invalidStatusCode
                    }

                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    guard let decodedData = try? decoder.decode(Quiz.self, from: data) else {
                        throw QuizError.failedToDecode
                    }

//                    DispatchQueue.main.async {
                        self.index = 0
                        self.score = 0
                        self.progress = 0
                        self.reachedEnd = false
                        self.quiz = decodedData.results
                        self.length = self.quiz.count
                        self.setQuestion()
//                    }
                    
                } catch {
                    throw QuizError.custom(error: error)
                }
                
            }
                        
        }

    
    func nextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
                reachedEnd = true
        }
    }
    
    func setQuestion() {
        answerSelected = false
        showCorrect = false
        showNext = false
        progress = CGFloat(Double(index) / Double(length) * 350)
        
        if index < length {
            let currentQuizQuestion = quiz[index]
            question = currentQuizQuestion.formattedQuestion
            answerChoices = currentQuizQuestion.answers
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.showNext = true
        }
        if answer.isCorrect {
            if difficulty == "easy" {
            configuredScore += 5
            } else if difficulty == "medium" {
                configuredScore += 10
            } else {
                configuredScore += 15
            }
            score += 1

        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.showCorrect = true
            }
        }
        
    }
    
    
}
