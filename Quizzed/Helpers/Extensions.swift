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
