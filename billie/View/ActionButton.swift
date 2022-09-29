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
            .foregroundColor(Color.actionColor)
            .scaleEffect(configuration.isPressed ? 0.8: 1)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}

struct doneEditingButton:ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        Image(systemName: "checkmark.circle")
            .foregroundColor(.actionColor)
            .font(.title2)
    }
}

struct scanButton: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    var isEnded: Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        HStack {
            Image(systemName: "doc.text.viewfinder")
            Text("Scan receipt")
                .fontWeight(.semibold)
                .font(Font.title3)
        }
        .scaleEffect(configuration.isPressed ? 0.8: 1)
        .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        .foregroundColor(colorScheme == .dark ? .blue:
                            Color.actionColor)
        .padding(.all, 12)
        .padding([.leading,.trailing])
        .opacity(isEnded ? 1: 0).animation(.easeInOut(duration: 0.1), value: isEnded).background(.white).opacity(isEnded ? 1 :0).animation(.easeOut(duration: 0.1), value: isEnded)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct manualEnterButton: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    var isEnded: Bool
    func makeBody(configuration: Configuration) -> some View {
        var animationSpeed: Double = 0.4
        configuration.label
        if isEnded{
            Text("Enter manually")
                .foregroundColor(colorScheme == .dark ? Color.white: Color.actionColor)
                .transition(.scale)
                .padding([.leading, .trailing, .bottom], 10)
        }
    }
}

