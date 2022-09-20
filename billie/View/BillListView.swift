//
//  BillListView.swift
//  billie
//
//  Created by Otávio Albuquerque on 13/09/22.
//

import SwiftUI

struct BillListView: View {
    @State private var slide = 50.0
    @State private var isEditing = false
    @State var tabs = Tabs()
    
    let alignment: Alignment = .bottom
    let width: CGFloat = 0.0
    let height: CGFloat = 0.0
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    
    @State var items: [TabItem] = [
        TabItem(name: "AGUACATE", quantity: 2, unitPrice: 5),
        TabItem(name: "VVatermelon", quantity: 1, unitPrice: 5),
        TabItem(name: "EarthMelon", quantity: 1, unitPrice: 5),
        TabItem(name: "Firemelon", quantity: 1, unitPrice: 5),
        TabItem(name: "Airmelon", quantity: 1, unitPrice: 5)
    ]
    
    var sumOfAllItems: Double {
        let totalPrices = items.map(\.totalPrice)
        return totalPrices.reduce(0, +)
    }
    
    var body: some View {
        NavigationView{
            VStack{
                
                List {
                    Section{
                        Button {
                            // Takes to the data saved
                            // The photo taken if possible, otherwise take the header off. =D
                        } label: {
                            HStack {
                                Text("Your tab")
                                Spacer()
                                Image(systemName: "photo")
                            }.foregroundColor(.primary)
                        }.padding([.leading,.trailing])
                        
                    } header: {
                        Text("successfully scanned, you can modify your tab below")
                            .font(.subheadline)
                            .listRowBackground(Color(.clear))
                            .listRowSeparator(.hidden)
                            .foregroundColor(.secondary)
                        
                    }.headerProminence(.increased)
                    
                    
                    ForEach($items) { $item in
                        billListRow(item: item.name, quantity: $item.quantity, unitPrice: item.unitPrice)
                    }
                    
                    HStack{
                        Text("c/ taxa de serviço").foregroundColor(.secondary)
                        Spacer()
                        Image(systemName: "info.circle").foregroundColor(.secondary)
                        Text("44.28").foregroundColor(.secondary)
                    }
                    .listRowSeparator(.hidden)
                }.listStyle(.grouped)
                    
            
                TotalOverView(totalPrice: sumOfAllItems)
            }
            
        }
    }
}

struct BillListView_Previews: PreviewProvider {
    static var previews: some View {
        BillListView()
    }
}

func teste() {
    print("asdas")
}
