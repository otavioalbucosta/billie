//
//  ItemNota.swift
//  billie
//
//  Created by Otávio Albuquerque on 19/09/22.
//

import Foundation

struct ItemNota{
    var id: UUID
    var product: String?
    var quantity: Int?
    var valUnit: Double?
    var valTotal: Double?
    
    init(product: String? = nil, quantity: Int? = nil, valUnit: Double? = nil, valTotal: Double? = nil) {
        self.id = UUID()
        self.product = product
        self.quantity = quantity
        self.valUnit = valUnit
        self.valTotal = valTotal
    }
}
