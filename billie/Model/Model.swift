//
//  ScanData.swift
//  billie
//
//  Created by Otávio Albuquerque on 08/09/22.
//

import Foundation
import SwiftUI

class TextItem: Identifiable {
    var id: String
    var text: String = ""
    
    init() {
        id = UUID().uuidString
    }
}


class RecognizedContent: ObservableObject {
    @Published var items = [TextItem]()
}


struct TabItem: Identifiable, Hashable, Equatable {
    var id = UUID()
    var name: String
    var quantity: Int
    var unitPrice: Double
    var totalPrice: Double {
        get {
            return Double(quantity) * (unitPrice)
        }
    }
    var isEditing: Bool = false
    var localeCode: String = "BRL"
    var formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()

    
    
    init(id: UUID = UUID(), name: String = "Error fetching data", quantity: Int = 0, unitPrice: Double = 0) {
        self.id = id
        self.name = name
        self.quantity = quantity
        self.unitPrice = unitPrice
    }
    
    func invalidDoubleValue(value: Double) -> Color {
        return value == 0 ? Color.red: Color.primary
    }
    
    func quantityControl(quantityValue: Int) -> Int {
        return (quantityValue == 0 ? quantityValue: quantityValue - 1)
        
    }
    
    func addNewItem() -> TabItem{
        var newItem = TabItem(name:"", quantity: 0, unitPrice: 0.0)
        newItem.isEditing.toggle()
        newItem.quantity = 1
        return newItem
    }
    

}
