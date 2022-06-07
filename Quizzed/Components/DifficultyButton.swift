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

            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("Red"))
                    
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color("Red2").opacity(0.5), lineWidth: 15)
                    .blur(radius: 15)
                    
            }
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .frame(height: 60)
            .frame(maxWidth: selectedDifficulty == difficulty ? .infinity : 0)
                
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
