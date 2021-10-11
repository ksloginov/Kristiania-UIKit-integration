//
//  LoadingIndicator.swift
//  PhotoAndAnimations
//
//  Created by Konstantin Loginov on 11/10/2021.
//

import SwiftUI
import Lottie

struct LoadingIndicator: UIViewRepresentable {
    
    var name: String
    
    var animationView = AnimationView()
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
        animationView.animation = Animation.named(name)
        animationView.loopMode = .loop
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}
