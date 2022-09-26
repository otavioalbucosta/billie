//
//  billieApp.swift
//  billie
//
//  Created by Otávio Albuquerque on 08/09/22.
//

import SwiftUI

@main
struct billieApp: App {
    @State var items: [TabItem] = [
    TabItem(),
    TabItem()
    ]
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
    }
}
