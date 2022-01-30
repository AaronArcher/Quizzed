//
//  Test.swift
//  Quizzed
//
//  Created by Aaron Johncock on 29/01/2022.
//

import SwiftUI

struct HomeHolderView: View {
    
    @State var showStats = false

    // Offset for drag gesture and showing menu
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    // Gesture offset
    @GestureState var gestureOffset: CGFloat = 0
    
    var body: some View {

        let statsViewWidth = screenSize().width - 90
        
//        ZStack {
//
//            StatsView(showStats: $showStats)
//
//            HomeView(showStats: $showStats)
////                .cornerRadius(showStats ? 20 : 0)
//                .rotation3DEffect(Angle.degrees(showStats ? -15 : 0), axis: (x: 0, y: 0, z: 0), anchor: .trailing)
//                .offset(x: showStats ? screenWidth / 2 : 0)
//                .ignoresSafeArea()
//
//        }
        
        HStack(spacing: 0) {
            
            StatsView(showStats: $showStats)
            
            HomeView(showStats: $showStats)
                .frame(width: screenSize().width)
            // Background when stats are showing
                .overlay(
                    Rectangle()
                        .fill(
                            Color("Blue1")
                                .opacity(Double((offset / statsViewWidth) / 1.5))
                        )
                        .ignoresSafeArea(.container, edges: .vertical)
                        .onTapGesture {
                            withAnimation {
                                showStats.toggle()
                            }
                        }
                )
        }
//        .frame(width: screenSize().width + statsViewWidth)
        .offset(x: -statsViewWidth / 2)
        .offset(x: offset > 0 ? offset : 0)
        .gesture(
        
            DragGesture()
                .updating($gestureOffset, body: { value, out, _ in
                    
                    out = value.translation.width
                })
                .onEnded(onEnd(value:))
        )
        .animation(.easeInOut, value: offset == 0)
        .onChange(of: showStats) { newValue in
            if showStats && offset == 0 {
                offset = statsViewWidth
                lastStoredOffset = offset
            }
            if !showStats && offset == statsViewWidth {
                offset = 0
                lastStoredOffset = 0
            }
        }
        .onChange(of: gestureOffset) { newValue in
            onChange()
        }

    }
    
    func onChange() {
        let statsViewWidth = screenSize().width - 90

        offset = (gestureOffset != 0) ? (gestureOffset + lastStoredOffset < statsViewWidth ? gestureOffset + lastStoredOffset : offset) : offset
    }
    
    func onEnd(value: DragGesture.Value) {
        let statsViewWidth = screenSize().width - 90
        let translation = value.translation.width
        
        withAnimation {
            if translation > 0 {
                if translation > (statsViewWidth / 2) {
                    // Show StatsView
                    offset = statsViewWidth
                    showStats = true
                }
                else {
                    
                    if offset == statsViewWidth {
                        return
                    }
                    
                    offset = 0
                    showStats = false
                }
            }
            else {
                if -translation > (statsViewWidth / 2) {
                    offset = 0
                    showStats = false
                }
                else {
                    
                    if offset == 0 || !showStats {
                        return
                    }
                    
                    offset = statsViewWidth
                    showStats = true
                }
            }
        }
        
        lastStoredOffset = offset
    }
    
}

struct HomeHolderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHolderView()
    }
}