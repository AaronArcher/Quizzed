//
//  SplashView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 09/01/2022.
//

import SwiftUI

struct SplashView: View {
    
    @State private var startAnimation = false
    @State private var lineAnimation = false
    @State private var screenAnimation = false
    @Binding var endAnimation: Bool
    
    let height = UIScreen.main.bounds.height
    @State var reveal = false
    @State var hideText = true
    
    var body: some View {
        
        ZStack {

//            Color("Red")
            
            
            Circle()
                .rotation(Angle(degrees: -90))
                .trim(from: 0, to: startAnimation ? 1 : 0)
                .stroke(
//                    LinearGradient(colors: [Color("Blue3"), Color("Blue2"), Color("Blue1"), Color("Blue1")], startPoint: .topLeading, endPoint: .bottomTrailing)
                    AngularGradient(colors: [Color("Blue1"), Color("Blue2"), Color("Blue2"), Color("Blue3"), Color("Blue2"), Color("Blue1")], center: .center)
                    , style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .frame(width: 200, height: 200)
                .opacity(hideText ? 0 : 1)

            
            RoundedRectangle(cornerRadius: 15)
                .rotation(Angle(degrees: 45))
                .offset(x: 70, y: 70)
                .fill(
                    LinearGradient(colors: [Color("Blue3"), Color("Blue2"), Color("Blue1")], startPoint: .leading, endPoint: .trailing)
                )
                .frame(width: lineAnimation ? 100 : 0, height: 20)
                .opacity(hideText ? 0 : 1)

            
            //MARK: Splash Text
            VStack {
           
                    
                Text("QUIZZED")
                    .font(Font.system(size: 50).bold())
                    .tracking(10)
                    .foregroundStyle(
                        LinearGradient(colors: [Color("Blue3"), Color("Blue2"), Color("Blue1")], startPoint: .leading, endPoint: .trailing)
                    )
                    .padding(.top, Constants.isScreenLarge ? 140 : 80)
                    
                    Spacer()
            
                
                
                Spacer()
                
                Text("Powered By")
                    .font(.subheadline)
                    .foregroundColor(Color("Blue1"))
                
                Text("Open Trivia Database")
                    .font(.caption)
                    .foregroundColor(Color("Blue1"))
                    .padding(.bottom, 60)

                
            }
            .onAppear(perform: {
                withAnimation(.easeInOut(duration: 0.5)) {
                    hideText = false
                }
            })
            .opacity(hideText ? 0 : 1)
            
        }
        .background(
            splashBackground
                .ignoresSafeArea()
                .rotationEffect(.degrees(45))
        )
        .ignoresSafeArea()
        .onAppear {
            
            DispatchQueue.main.async {
                withAnimation(.easeInOut(duration: 0.75).delay(0.25)) {
                    startAnimation = true
                }

                withAnimation(.easeInOut(duration: 0.5).delay(1)) {
                    lineAnimation = true
                }

                withAnimation(.linear.delay(2.5)) {
                    screenAnimation = true
                    hideText = true
                }

                withAnimation(.easeInOut(duration: 1.5).delay(2.5)) {
                    reveal = true
                }
            }

//            withAnimation(.easeInOut.delay(3.5)) {
//                endAnimation = true
//            }
            
            
        }
    
    }
    
    var splashBackground: some View {
        ZStack {
            VStack(spacing: 0) {

                Rectangle()
                    .fill(Color("Red"))
                    .frame(width: height * 2, height: height * 2)
                    .offset(y: reveal ? -height * 2 : 0)

                Rectangle()
                    .fill(Color("Red"))
                    .frame(width: height * 2, height: height * 2)
                    .offset(y: reveal ? height * 2 : 0)

            }
        }
        .ignoresSafeArea()
    }
    
    
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

