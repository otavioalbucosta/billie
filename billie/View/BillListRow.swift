//
//  billListRow.swift
//  billie
//
//  Created by Otávio Albuquerque on 12/09/22.
//

import SwiftUI

struct billListRow: View {
    var code: Int
    var item: String
    var quantity: Int
    var price: Double
    var totalPrice: Double
    var body: some View {
        HStack{
            Text(code.formatted())
                .frame(maxWidth: 50, alignment: .leading)
            Text(item)
                .frame(maxWidth: 100,alignment: .leading)
            Text(quantity.formatted())
                .frame(width: 50,alignment: .trailing)
            Text(price.formatted())
                .frame(maxWidth: .infinity,alignment: .trailing)
            Text(totalPrice.formatted())
                .frame(maxWidth: .infinity, alignment: .trailing)
            
        }



    }
}

struct billListRow_Previews: PreviewProvider {
    static var previews: some View {
        
        billListRow(code: 0300,item: "Batata doce", quantity: 5, price: NSNumber(floatLiteral: 9.50).doubleValue, totalPrice: NSNumber(floatLiteral: 9.50*5).doubleValue )
    }
}
