//
//  Answer.swift
//  Quizzed
//
//  Created by Aaron Johncock on 10/01/2022.
//

import Foundation

struct Answer: Identifiable {
    let id = UUID()
    let text: AttributedString
    let isCorrect: Bool
}
