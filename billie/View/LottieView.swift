//
//  LottieView.swift
//  billie
//
//  Created by Pedro Muniz on 14/09/22.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    @Binding var isEnded: Bool
    typealias UIViewType = UIView
    var filename: String //makes this customizable: we pass the file name in the Loading View
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = AnimationView() //creates the animation
        let animation = Animation.named(filename) //sets the file name
        animationView.animation = animation //specifies the animation for the view created
        animationView.contentMode = .scaleAspectFit //scales the animation properly
        animationView.play { finished in
            isEnded.toggle()
        }
        
        //here we deal with constraints:
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView) // inserts the animationView in the view being returned
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        
    }
}
