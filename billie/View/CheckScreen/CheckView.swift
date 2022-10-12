//
//  CheckView.swift
//  billie
//
//  Created by Luciana Adrião on 27/09/22.
//

import SwiftUI

struct CheckView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var itemData: [TabItem]
    @State var slideSuceeded: Bool = false
    @State var shouldPop: Bool = false
    
    var sumOfAllItems: Double {
        let totalPrices = itemData.map(\.totalPrice)
        return totalPrices.reduce(0, +)
    }
    
    var body: some View {
        ZStack {
            VStack {
                ItemListView(items: $itemData)
                
                TotalOverlay(sumTotalPrice: sumOfAllItems, slideSuceeded: $slideSuceeded)
                    .background(Color(uiColor: .secondarySystemGroupedBackground))
            }
            .ignoresSafeArea(.keyboard)
            .scrollDismissesKeyboard(.interactively)
        }
        .sheet(isPresented: $slideSuceeded){
//            CheckoutView(totalPrice: sumOfAllItems)
            PaymentView(shouldPop: $shouldPop)
        }
        .onDisappear{
            itemData.removeAll()
        }
        .navigationTitle("Here is your receipt")
        .navigationDestination(isPresented: $shouldPop) {
            LottieSucessView()
                .onDisappear {
                    dismiss()
                }
        }
    }
}

struct CheckView_Previews: PreviewProvider {
    @State static var items:[TabItem] = [
        TabItem(name: "Batilisk Wings", quantity: 1, unitPrice: 37.2),
        TabItem(name: "Veggie burger", quantity: 1, unitPrice: 27.9),
        
        TabItem(name: "Batilisk Wings", quantity: 1, unitPrice: 37.2),
        TabItem(name: "Veggie burger", quantity: 1, unitPrice: 27.9),
        
        TabItem(name: "Batilisk Wings", quantity: 1, unitPrice: 37.2),
        TabItem(name: "Veggie burger", quantity: 1, unitPrice: 27.9),
        
        TabItem(name: "Batilisk Wings", quantity: 1, unitPrice: 37.2),
        TabItem(name: "Veggie burger", quantity: 1, unitPrice: 27.9),
        
        TabItem(name: "Batilisk Wings", quantity: 1, unitPrice: 37.2),
        TabItem(name: "Veggie burger", quantity: 1, unitPrice: 27.9),
    ]
    
    static var previews: some View {
        CheckView(itemData: $items, slideSuceeded: false)
    }
}


