//
//  SwiftUIView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 29/01/2022.
//

import SwiftUI

extension View {
    
    // MARK: Rules popup extension
    func rulesPopup<Content: View>(show: Binding<Bool>,@ViewBuilder content: @escaping ()-> Content)-> some View {
        return self
            .overlay {
                if show.wrappedValue {
                    content()
                }
            }
    }
    
    // MARK: Extension to get screen size
    func screenSize() -> CGRect {
        return UIScreen.main.bounds
    }
    
    // MARK: Extension for the header background modifier
    func headerShapeModifier() -> some View {
        modifier(HeaderShapeModifier())
    }
    
    // MARK: Extension for bottom button modifier
    func bottomButtonModifier(isActive: Bool) -> some View {
        modifier(BottomButtonModifier(isActive: isActive))
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

