//
//  SwiftUIView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 29/01/2022.
//

import SwiftUI

// MARK: Rules popup extension
extension View {
    
    // MARK: Custom Modifier for Rules Popup
    func rulesPopup<Content: View>(show: Binding<Bool>,@ViewBuilder content: @escaping ()-> Content)-> some View {
        
        return self
            .overlay {
                
                if show.wrappedValue {
                    content()
                }
            }
    }
}

// MARK: Extension to get screen size
extension View {
    func screenSize() -> CGRect {
        return UIScreen.main.bounds
    }
}

// MARK: Extension for the header background shape
extension View {
    func headerShapeModifier() -> some View {
        modifier(HeaderShapeModifier())
    }
}

extension QuizViewModel {
    enum QuizError: LocalizedError {
        case custom(error: Error)
        case failedToDecode
        case invalidStatusCode
        
        var errorDescription: String? {
            switch self {
            case .failedToDecode:
                return "Failed to decode response"
            case .invalidStatusCode:
                return "Something went wrong loading data from the web"
            case .custom(let error):
                return error.localizedDescription
            }
        }
    }
}

