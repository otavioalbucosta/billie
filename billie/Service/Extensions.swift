//
//  Extensions.swift
//  billie
//
//  Created by Luciana Adrião on 26/09/22.
//

import Foundation
import SwiftUI

extension Color {
    static let backgroundTopColor = Color("background1")
    static let backgroundBottomColor = Color("background2")
    static let scanButtonTextColor = Color(red: 36/255, green: 123/255, blue: 160/255)
}

extension Font {
    static let TotalOverlayFont = Font.title3.bold()
    static let nameCellFont = Font.title2.bold()
    static let anyCellFont = Font.body
}

extension LinearGradient {
    static let backgroundGradientLight = LinearGradient(gradient: Gradient(colors: [
        Color.backgroundTopColor,
        Color.backgroundBottomColor,
        Color.backgroundBottomColor.opacity(0.7),]),
                   startPoint: .top,
                   endPoint: .bottom)
    
    static let backgroundGradientDark = LinearGradient(gradient: Gradient(colors: [
        .blue,
        .clear]),startPoint: .top, endPoint: .bottom)
}
