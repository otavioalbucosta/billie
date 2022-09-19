//
//  ActionButton.swift
//  billie
//
//  Created by Luciana Adrião on 18/09/22.
//

import Foundation
import SwiftUI
import CoreHaptics

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
//            .padding()
//            .background(Color.accentColor)
//            .foregroundColor(.primary)
            .clipShape(Capsule(style: .continuous))
            .scaleEffect(configuration.isPressed ? 0.8: 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .font(Font.title)
    }
}
struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15.0)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}
