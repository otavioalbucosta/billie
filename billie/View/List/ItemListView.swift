//
//  ItemListView.swift
//  billie
//
//  Created by Luciana Adrião on 27/09/22.
//

import SwiftUI

struct ItemListView: View {
    @Binding var items: [TabItem]
    
    var sumOfAllItems: Double {
        let totalPrices = items.map(\.totalPrice)
        return totalPrices.reduce(0, +)
    }
    
    var body: some View {
        List {
            Section {
                ForEach(items, id: \.self) { item in
                    ItemBillCell(itemModel: item)
                }
                Text("\(sumOfAllItems)")
            } header: {
                Text("successfully scanned, you can modify your tab below")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }.headerProminence(.increased)
        }.listStyle(.grouped)
        
    }
}

struct ItemListView_Previews: PreviewProvider {
    
    @State static var items2: [TabItem] = [
        TabItem(quantity: 2, unitPrice: 2.0),
        TabItem(),
        TabItem(unitPrice: 2.0),
        TabItem()
    ]
    
    static var previews: some View {
        ItemListView(items: $items2)
    }
}
