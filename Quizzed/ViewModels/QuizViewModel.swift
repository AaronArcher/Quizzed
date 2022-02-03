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
    
    @Published var categoryID = "20"
    @Published var difficulty = "easy"
    @Published var selectedCategory = "Animals"
    
    

    
        func fetchQuiz() async {

            guard let url = URL(string: "https://opentdb.com/api.php?amount=10&category=\(categoryID)&difficulty=\(difficulty)") else { fatalError("Missing URL") }

            let urlRequest = URLRequest(url: url)

            do {
                let (data, response) = try await URLSession.shared.data(for: urlRequest)

                guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }

                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedData = try decoder.decode(Quiz.self, from: data)

                DispatchQueue.main.async {
                    self.index = 0
                    self.score = 0
                    self.progress = 0
                    self.reachedEnd = false
                    self.quiz = decodedData.results
                    self.length = self.quiz.count
                    self.setQuestion()
                }
            } catch {
                print("Error fetching quiz data: \(error)")
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
        progress = CGFloat(Double(index) / Double(length) * 350)
        
        if index < length {
            let currentQuizQuestion = quiz[index]
            question = currentQuizQuestion.formattedQuestion
            answerChoices = currentQuizQuestion.answers
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            if difficulty == "easy" {
            configuredScore += 5
            } else if difficulty == "medium" {
                configuredScore += 10
            } else {
                configuredScore += 15
            }
            score += 1
        }
    }
    
    
}
