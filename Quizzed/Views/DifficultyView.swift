//
//  DifficultyView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 09/01/2022.
//

import SwiftUI

struct DifficultyView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var selectedCategory: String
    
    @State var selectedDifficulty = "Easy"
    
    var body: some View {

        ZStack(alignment: .top) {
            Color("Purple")
            
            VStack(spacing: 20) {
            
                Text("QUIZZED")
                    .foregroundColor(Color("Yellow"))
                    .font(.system(size: 45, weight: .bold))
                    .padding(.top, 40)
                
                Text("SELECT A DIFFICULTY")
                    .foregroundColor(Color("Orange"))
                    .font(.title2)
                    .fontWeight(.light)
                    .padding(.bottom, 30)
                
                
               // Difficulties
                Group {
                    DifficultyBlock(selectedDifficulty: $selectedDifficulty, difficulty: "Easy", color: "Blue")
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                selectedDifficulty = "Easy"
                            }
                        }
                        .frame(height: 80)
                    
                    DifficultyBlock(selectedDifficulty: $selectedDifficulty, difficulty: "Medium", color: "Orange")
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                selectedDifficulty = "Medium"
                            }
                        }
                        .frame(height: 80)

                    DifficultyBlock(selectedDifficulty: $selectedDifficulty, difficulty: "Hard", color: "Yellow")
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                selectedDifficulty = "Hard"
                            }
                        }
                        .frame(height: 80)
                }
                
                // Selected category
                VStack(spacing: 0) {
                    Text("Category selected:".uppercased())
                        .foregroundColor(Color("Yellow"))
                        .font(.title2)
                        .padding(.top)
                        .padding(.bottom, 5)
                    
                    Text(selectedCategory)
                        .foregroundColor(.white)
                        .font(.title3)
                }
                
                // Selected Difficulty
                VStack(spacing: 0) {
                    Text("Difficulty selected:".uppercased())
                        .foregroundColor(Color("Yellow"))
                        .font(.title2)
                        .padding(.top)
                        .padding(.bottom, 5)
                    
                    Text(selectedDifficulty)
                        .foregroundColor(.white)
                        .font(.title3)
                     
                }
//                .padding(.bottom, 30)


                RoundedRectangle(cornerRadius: 5)
                    .frame(width: UIScreen.main.bounds.width - 40, height: 1)
                    .foregroundColor(Color("Yellow"))
                    .padding(.top, 30)
                
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()

                    } label: {
                        
                        Image(systemName: "arrow.left")
                            .font(.system(size: 30, weight: .light))
                            .padding(.horizontal)
                        
                        Text("BACK")
                            .font(.title)
                            .fontWeight(.light)
                    }
                    
                        Spacer()
                        
                        NavigationLink {
                            
                        } label: {
                            
                            Text("NEXT")
                                .font(.title)
                                .fontWeight(.light)
                                
                            Image(systemName: "arrow.right")
                                .font(.system(size: 30, weight: .light))
                                .padding(.horizontal)

                    }
                }
                .foregroundColor(Color("Orange"))
                
                
            }
            .frame(maxHeight: .infinity)
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct DifficultyView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyView(selectedCategory: .constant("Comics"))
    }
}

struct DifficultyBlock: View {
    
    @Binding var selectedDifficulty: String
    
    var difficulty: String
    var color: String
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color(color))
                .frame(height: 80)
            
            Text(difficulty.uppercased())
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.light)
            
            DifficultyShape1()
                .trim(from: 0, to: selectedDifficulty == difficulty ? 1 : 0)
                .stroke(.white, lineWidth: 1.5)

            DifficultyShape2()
                .trim(from: 0, to: selectedDifficulty == difficulty ? 1 : 0)
                .stroke(.white, lineWidth: 1.5)

        }
        
    }
}

struct DifficultyShape1: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            
            path.move(to: CGPoint(x: rect.minX + 20, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX - 80, y: rect.midY))

            
        }
    }
}

struct DifficultyShape2: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            
            path.move(to: CGPoint(x: rect.maxX - 20, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX + 80, y: rect.midY))

            
        }
    }
}
