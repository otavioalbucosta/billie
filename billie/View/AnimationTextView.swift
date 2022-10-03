//
//  AnimationTextView.swift
//  billie
//
//  Created by Luciana Adrião on 28/09/22.
//

import SwiftUI

struct AnimationTextView: View {
    var body: some View {
        Home()
    }
}

struct AnimationTextView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTextView()
    }
}


struct Home: View {
    var body: some View {
        VStack(spacing: 20) {
            textShimmer(text: "Affe g-zuis")
        }
    }
}

struct textShimmer: View {
    @State var animation = false
    var text: String
    
    var body: some View {
        
        ZStack {
            Text(text)
                .font(.sliderFont)
                .foregroundColor(.actionColor.opacity(0.8))
            
            HStack(spacing: 0) {
                ForEach(0 ..< text.count, id: \.self) { index in
                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                        .font(.sliderFont)
                        .foregroundColor(Color.white)
                }
            }
            .mask (
                Rectangle()
                    .fill(
                        LinearGradient(colors: [Color.white.opacity(0.25), Color.white], startPoint: .leading, endPoint: .trailing)
                    )
                    .blur(radius: 10)
                    .rotationEffect(Angle(degrees: 70))
                    .offset(x: -100)
                    .offset(x: animation ? 400 : 0)
            ).onAppear {
                withAnimation (
                    Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                        animation.toggle()
                    }
            }
        }
    }
    
    
    func generateRandomColor() -> Color {
        let color = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha:  1)
        return Color(color)
    }
}
