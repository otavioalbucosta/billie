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
        //            .background(Color.accentColor)
        //            .foregroundColor(.primary)
            .clipShape(RoundedRectangle(cornerRadius: 20))
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

struct quantityButton:ButtonStyle {
    var nameString: String
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        Image(systemName: nameString)
            .foregroundColor(Color.accentColor)
            .scaleEffect(configuration.isPressed ? 0.8: 1)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}

struct swipeButton:ButtonStyle {
    var nameString:String
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        Image(systemName: nameString)
            .foregroundColor(.purple)
            .animation(.easeInOut(duration: 0.4), value: configuration.isPressed)
        
    }
}

struct doneEditingButton:ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        Image(systemName: "checkmark.circle")
            .foregroundColor(.accentColor)
            .font(.title2)
    }
}

