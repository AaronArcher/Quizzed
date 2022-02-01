//
//  QuestionView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 27/01/2022.
//

import SwiftUI

struct QuestionView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    @EnvironmentObject var quizModel: QuizViewModel
    
    @Binding var selectedCategory: String
    @Binding var categoryImage: String
    
    @State private var showingAlert = false
    
    @State private var showQuiz = false
    
    var body: some View {
        
        
        if quizModel.reachedEnd {
            
            ResultView()
                .environmentObject(quizModel)
            
        } else {
            
        VStack(spacing: 0) {
            
            // MARK: Header
            ZStack {
                
                RoundedCornerShape(corners: [.bottomLeft, .bottomRight], radius: 25)
                    .frame(height: screenSize().height / 7)
                    .foregroundColor(Color("Red"))
                
                HStack(spacing: 15) {
                        
                        Image(categoryImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 40)
                    
                    
                    Text(selectedCategory)
                        .foregroundColor(.white)
                        .font(.title2)
                    
                    Spacer()
                    
                    Button {
                        showingAlert = true
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(.white)
                                .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                            
                            Image(systemName: "xmark")
                                .font(.title2)
                                .foregroundColor(Color("Blue1"))
                        }
                        .frame(width: 30, height: 30)
                    }

                }
                .padding(.horizontal)
            }
            
            
            
            if !showQuiz {
                
                Text("Loading Quiz")
                    .padding(.top, 60)
                    .font(.title3)
                    .padding(.bottom, 30)
                
                LottieView()
                    .frame(width: screenSize().width / 2, height: screenSize().width / 2)
                
           
            }
            
            else {
                //MARK: Score
                HStack {
                    
                    VStack {
                        Text("Question")
                            .font(.headline)
                        
                        Text("\(quizModel.index + 1) out of \(quizModel.length) ")
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Score")
                            .font(.headline)
                        
                        Text("\(quizModel.score)")
                            .font(.subheadline)
                    }
                }
                .padding(.horizontal, 40)
                .padding(.top, 20)
                
        
                ProgressBarView(progress: quizModel.progress)
                    .padding(.top, 10)
                    .padding(.horizontal, 30)
                
                // MARK: Questions
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text(quizModel.question)
                            .foregroundColor(.white)
                            
                        ForEach(quizModel.answerChoices, id: \.id) { answer in
                            
                            AnswerRow(answer: answer)
                                .environmentObject(quizModel)
                        }
                        
                            
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
               
            }
            
//            // MARK: Questions
//            VStack(alignment: .leading, spacing: 10) {
//
//                Text(quizModel.question)
//                    .foregroundColor(.white)
//
//                ForEach(quizModel.answerChoices, id: \.id) { answer in
//
//                    AnswerRow(answer: answer)
//                        .environmentObject(quizModel)
//                }
//
//
//            }
//            .padding(.horizontal)
//            .padding(.top, 20)
            
            Spacer()
            
            
            Button {
                quizModel.nextQuestion()
            } label: {
                ZStack{
                    RoundedCornerShape(corners: [.topLeft, .topRight], radius: 25)
                        .frame(height: screenSize().height / 9)
                        .foregroundColor(Color("Red"))
                    
                    Text("NEXT")
                        .font(.largeTitle)
                        .padding(.bottom, 10)
                        .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                    
                }
                .opacity(!quizModel.answerSelected ? 0.4 : 1)
            }
            .disabled(!quizModel.answerSelected)

            
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                showQuiz = true
            }
        })
        .ignoresSafeArea()
        .foregroundColor(.white)
        .background(Color("Blue1"))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .task {
            do {
                try await quizModel.fetchQuiz()
            } catch {
                print("Error", error)
            }
        }
        .alert("Are you sure you want to quit?", isPresented: $showingAlert) {
            Button("Yes") {
                presentationMode.wrappedValue.dismiss()
            }
            Button("No", role: .cancel) {}
        }
    }
        
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(selectedCategory: .constant("Animals"), categoryImage: .constant("Animals"))
            .environmentObject(QuizViewModel())
        
    }
}
