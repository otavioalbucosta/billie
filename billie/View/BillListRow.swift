//
//  billListRow.swift
//  billie
//
//  Created by Otávio Albuquerque on 12/09/22.
//

import SwiftUI

struct billListRow: View {
    var item: String
    var quantity: Int
    var price: Decimal
    var body: some View {
        HStack{
            Text(item)
                .frame(maxWidth: .infinity,alignment: .leading)
            Text(quantity.formatted())
                .frame(width: 100,alignment: .trailing)
            Text(price.formatted())
                .frame(maxWidth: .infinity,alignment: .trailing)
        }



    }
}

struct billListRow_Previews: PreviewProvider {
    static var previews: some View {
        
        billListRow(item: "Batata doce", quantity: 5, price: NSNumber(floatLiteral: 9.50).decimalValue)
    }
}
