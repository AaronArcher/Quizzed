//
//  LottieView.swift
//  Quizzed
//
//  Created by Aaron Johncock on 31/01/2022.
//

import SwiftUI
import Lottie

struct LoadingView: UIViewRepresentable {
    
    var name: String = "loadingAnimation"
    var loopMode: LottieLoopMode = .loop
    
    func makeUIView(context: UIViewRepresentableContext<LoadingView>) -> UIView {
        
        let view = UIView(frame: .zero)
        let animationView = AnimationView()
        
        let animation = Animation.named(name)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LoadingView>) {
        
    }
}
