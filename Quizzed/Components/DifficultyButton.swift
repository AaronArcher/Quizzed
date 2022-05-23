//
//  DifficultyButton.swift
//  Quizzed
//
//  Created by Aaron Johncock on 26/01/2022.
//

import SwiftUI

struct DifficultyButton: View {
    
    @Binding var selectedDifficulty: String
    var difficulty: String = "Easy"
    
    var body: some View {

        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("Blue3"))
//                .shadow(color: selectedDifficulty == difficulty ? .clear : Color("Blue3"), radius: 3, x: 3, y: 3)
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("Red"))
                .frame(height: 60)
                .frame(maxWidth: selectedDifficulty == difficulty ? .infinity : 0)
//                .shadow(color: selectedDifficulty == difficulty ? Color("Red") : .clear, radius: 3, x: 3, y: 3)
                
            HStack {
                Spacer()
                
                Text(difficulty.uppercased())
                    .font(.title)
                    .foregroundColor(.white)
                .padding(.leading, 10)
                
                Spacer()
            }

            
        }
        .frame(height: 60)


    }
}

struct DifficultyButton_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyButton(selectedDifficulty: .constant(""))
    }
}
