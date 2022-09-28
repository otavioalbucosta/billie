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
        TabItem(name: "Batilisk Wings", quantity: 1, unitPrice: 37.2),
        TabItem(name: "Veggie burger", quantity: 1, unitPrice: 27.9),
        TabItem(name: "Pierogi", quantity: 1, unitPrice: 20.0),
        TabItem(name: "Fishsticks", quantity: 1, unitPrice: 37.9),
        TabItem(name: "Stone soup", quantity: 1, unitPrice: 12.0),
        TabItem(name: "Seeds", quantity: 1, unitPrice: 2.0),
        TabItem(name: "Cooked Seeds", quantity: 1, unitPrice: 5.0),
    ]
    var body: some Scene {
        WindowGroup {
//                        BillListView(items: $items)
            HomeScreenView()
//            ItemListView(items: $items)
//            CheckView(itemData: $items)
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
