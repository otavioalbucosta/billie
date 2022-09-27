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
    TabItem(),
    TabItem(),
    TabItem(),
    TabItem(),
    TabItem(),
    TabItem(),
    ]
    var body: some Scene {
        WindowGroup {
//            BillListView(items: $items)
            SplashScreenView()
//            Some_test()
        }
    }
    
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
