//
//  ItemModel.swift
//  billie
//
//  Created by Luciana Adrião on 27/09/22.
//

import Foundation
import SwiftUI

//struct TabItem: Identifiable, Hashable, Equatable {
//    var id = UUID()
//    var name: String
//    var quantity: Int
//    var unitPrice: Double
//    var totalPrice: Double {
//        get {
//            return Double(quantity) * (unitPrice)
//        }
//    }
//    var isEditing: Bool = false
//    var localeCode: String = "BRL"
//    
//
//    init(id: UUID = UUID(), name: String = "Error fetching data", quantity: Int = 0, unitPrice: Double = 0) {
//        self.id = id
//        self.name = name
//        self.quantity = quantity
//        self.unitPrice = unitPrice
//    }
//
//    func invalidDoubleValue(value: Double) -> Color {
//        return value == 0 ? Color.red: Color.primary
//    }
//
//    func quantityControl(quantityValue: Int) -> Int {
//        return (quantityValue == 0 ? quantityValue: quantityValue - 1)
//
//    }
//
//}
