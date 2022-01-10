//
//  Answer.swift
//  Quizzed
//
//  Created by Aaron Johncock on 10/01/2022.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
