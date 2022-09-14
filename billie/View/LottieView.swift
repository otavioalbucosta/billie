//
//  LottieView.swift
//  billie
//
//  Created by Pedro Muniz on 14/09/22.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    typealias UIViewType = UIView
    var filename: String //makes this customizable: we pass the file name in the Loading View
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = AnimationView() //creates the animation
        let animation = Animation.named(filename) //sets the file name
        animationView.animation = animation //specifies the animation for the view created
        animationView.contentMode = .scaleAspectFit //scales the animation properly
        animationView.play()
        
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

//struct LottieView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct LottieView_Previews: PreviewProvider {
//    static var previews: some View {
//        LottieView()
//    }
//}
