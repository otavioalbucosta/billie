//
//  ItemBillCell.swift
//  billie
//
//  Created by Luciana Adrião on 27/09/22.
//

import SwiftUI

struct ItemBillCell: View {
    @State var itemModel: TabItem
    
    var body: some View {
        VStack( alignment: .leading) {
            HStack(alignment: .center) {
                Text(itemModel.name).font(.nameCellFont)
                Spacer()
                Text(itemModel.totalPrice, format: .currency(code: itemModel.localeCode))
                    .font(.body.bold())

                    .foregroundColor(itemModel.invalidDoubleValue(value: itemModel.totalPrice))
                
            }.padding(.bottom, 10)
            
            HStack(alignment: .bottom) {
                Text(itemModel.unitPrice, format: .currency(code: itemModel.localeCode))
                    .foregroundColor(itemModel.invalidDoubleValue(value: itemModel.unitPrice))
                Spacer()
                
                Button("") {
                    itemModel.quantity = itemModel.quantityControl(quantityValue: itemModel.quantity)
                }.buttonStyle(quantityButton(nameString: "minus.circle"))

                Text("\(itemModel.quantity)x")
                Button("") {
                    itemModel.quantity = itemModel.quantity + 1
                }.buttonStyle(quantityButton(nameString: "plus.circle"))
            }
        }.padding([.leading,.trailing], 10)
    }
}

struct ItemBillCell_Previews: PreviewProvider {
    @State static var ab1 = TabItem(name: "ABOBRINHA", quantity: 10, unitPrice: 22.0 )
    
    static var previews: some View {
        ItemBillCell(itemModel: ab1)
        
    }
}
