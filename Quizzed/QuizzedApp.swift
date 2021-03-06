//
//  QuizzedApp.swift
//  Quizzed
//
//  Created by Aaron Johncock on 09/01/2022.
//

import SwiftUI

@main
struct QuizzedApp: App {
    
    @StateObject var stats = StatsViewModel()

    var body: some Scene {
        WindowGroup {
            StartView()
                .preferredColorScheme(.dark)
                .environmentObject(stats)

        }

    }
}
