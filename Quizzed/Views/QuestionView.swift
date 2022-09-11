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
    
    @State private var showingAlert = false
    @State private var alertText = ""
    @State private var isAlertToQuit = false
    
    @State private var showQuiz = false
    
    @State private var hasError = false
    @State private var error: QuizViewModel.QuizError?
    
    var body: some View {
        
        
        VStack(spacing: 0) {
            
//             Progammatic Navigation link to results view when the quiz ends
            NavigationLink(destination: ResultView(), isActive: $quizModel.reachedEnd) {
                EmptyView()
            }
            
            // MARK: Header
            
            HStack(spacing: 15) {
                
                Image(quizModel.selectedCategory)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 40)
                
                
                Text(quizModel.selectedCategory)
                    .foregroundColor(.white)
                    .font(.title2)
                
                Spacer()
                
                Button {
                    alertText = "Are you sure you want to quit?"
                    isAlertToQuit = true
                    showingAlert = true
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(.white)
                            .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                        
                        Image(systemName: "xmark")
                            .font(.title).dynamicTypeSize(.medium)
                            .foregroundColor(Color("Blue1"))
                    }
                    .frame(width: 32, height: 32)
                }
                
            }
            .padding(.horizontal)
            .padding(.top, ScreenOptions.headerPadding())
            .padding(.bottom, 25)
            .background(
                ZStack {
                    RoundedCornerShape(corners: [.bottomLeft, .bottomRight], radius: 25)
                        .foregroundColor(Color("Red"))
                    
                    RoundedCornerShape(corners: [.bottomLeft, .bottomRight], radius: 25)
                        .stroke(Color("Red2").opacity(0.5), lineWidth: 20)
                        .blur(radius: 20)
                }
            )
            .clipShape(RoundedCornerShape(corners: [.bottomLeft, .bottomRight], radius: 25))
            // Cannot put 2 alerts on the same view so added the second alert here as the header is always on screen
            .alert(isPresented: $hasError, error: error) {
                Button {
                    Task {
                        await execute()
                    }
                } label: {
                    Text("Retry")
                }
                
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            
            
            if !showQuiz {
                
                Text("Loading Quiz")
                    .padding(.top, 60)
                    .font(.title3)
                    .padding(.bottom, 30)
                
                LoadingView()
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
                    .accessibilityElement(children: .combine)
                    
                    Spacer()
                    
                    VStack {
                        Text("Score")
                            .font(.headline)
                        
                        Text("\(quizModel.configuredScore)")
                            .font(.subheadline)
                            .animation(nil)
                    }
                    .accessibilityElement(children: .combine)

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
                    
                    ScrollView {
                        ForEach(quizModel.answerChoices, id: \.id) { answer in
                            
                            AnswerRow(answer: answer)
                                .accessibilityAddTraits(.isButton)
                            
                        }
                    }
                    
                    
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
            }
            
            Spacer()
            
            
            Button {
                quizModel.nextQuestion()
            } label: {

                Text("NEXT")
                    .font(.largeTitle)
                    .shadow(color: Color("Blue3"), radius: 3, x: 3, y: 3)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, ScreenOptions.bottomButtonPadding())
                    .padding(.top, 15)
                    .background(
                        ZStack {
                            RoundedCornerShape(corners: [.topLeft, .topRight], radius: 25)
                                .foregroundColor(Color("Red"))

                            RoundedCornerShape(corners: [.topLeft, .topRight], radius: 25)
                                .stroke(Color("Red2").opacity(0.5), lineWidth: 20)
                                .blur(radius: 20)
                        }
                    )
                    .clipShape(RoundedCornerShape(corners: [.topLeft, .topRight], radius: 25))
                    .opacity(!quizModel.showNext ? 0.4 : 1)
                    .animation(.easeInOut, value: quizModel.showNext)


            }
            .disabled(!quizModel.showNext)
            
            
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if quizModel.quiz.count != 0 {
                    showQuiz = true
                } else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        alertText = "Took too long to load quiz. Check connection and try again."
                        isAlertToQuit = false
                        showingAlert = true
                        
                    }
                }
            }
            
            
            
        })
        .ignoresSafeArea()
        .foregroundColor(.white)
        .background(
            LinearGradient(colors: [Color("Blue1"), Color("Blue1"), Color("Blue2"), Color("Blue1"), Color("Blue1")], startPoint: .top, endPoint: .bottom)
        )
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .task {
            await execute()
        }
        .alert(alertText, isPresented: $showingAlert) {
            if isAlertToQuit {
                Button("Yes") {
                    presentationMode.wrappedValue.dismiss()
                }
                Button("No", role: .cancel) {}
                
            } else {
                Button("OK") {
                    presentationMode.wrappedValue.dismiss()
                }
                
            }
        }
        
        
    }
    
    func execute() async {
        do {
            try await quizModel.fetchQuiz()
        } catch {
            if let quizError = error as? QuizViewModel.QuizError {
                self.hasError = true
                self.error = quizError
            }
        }
    }
    
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(QuizViewModel())
        
    }
}
