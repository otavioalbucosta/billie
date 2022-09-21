//
//  ScanData.swift
//  billie
//
//  Created by Otávio Albuquerque on 08/09/22.
//

import Foundation

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
            if let _totalPrice = _totalPrice{
                return _totalPrice
            }else{
                return Double(quantity) * (unitPrice)
            }

        }
        set { _totalPrice = newValue}
    }
    
    var _totalPrice: Double?
    
    init(id: UUID = UUID(), name: String = "Erro na leitura", quantity: Int = 0, unitPrice: Double = 0, totalPrice: Double = 0) {
        self.id = id
        self.name = name
        self.quantity = quantity
        self.unitPrice = unitPrice
        self.totalPrice = totalPrice
    }

}


class Tabs: ObservableObject {
    @Published var itemsTab = [TabItem]()
}
