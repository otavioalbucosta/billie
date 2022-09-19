//
//  billListRow.swift
//  billie
//
//  Created by Otávio Albuquerque on 12/09/22.
//

import SwiftUI

struct billListRow: View {
    var item: String
    @State var quantity: Int
    var price: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(item)
                    .font(Font.title2.bold())
                    .lineLimit(1)
                    .padding([.trailing],15)
                Spacer()
                Text("R$ \(Double(quantity)*price, specifier: "%.2f")")
                    .font(Font.headline.bold())
            }
            .padding([.bottom],5)
            HStack{
                Text("R$ \(price,specifier: "%.2f")")
                Spacer()
                Button {
                    // minus the actual value. If value equals zero, delete the row.
                    if quantity == 0 {
                        
                    } else {
                        
                        quantity = quantity - 1
                    }
                    
                } label: {
                    Image(systemName: "minus.circle")
                }
                Text("\(quantity)x")
                Button {
                    // plus the actual value.
                    quantity = quantity + 1
                } label: {
                    Image(systemName: "plus.circle")
                }
            }
        }
        .buttonStyle(.borderless)
    }
}

struct billListRow_Previews: PreviewProvider {
    static var previews: some View {
        
        billListRow(item: "Batata doce", quantity: 5, price: NSNumber(floatLiteral: 9.50).doubleValue )
    }
}
