//
//  BillListView.swift
//  billie
//
//  Created by Otávio Albuquerque on 13/09/22.
//

import SwiftUI
import Foundation

struct BillListView: View {
    @State private var slide = 50.0
    @State private var isEditing = false
    @Binding var items: [TabItem]
    
    let alignment: Alignment = .bottom
    let width: CGFloat = 0.0
    let height: CGFloat = 0.0
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    
    
    var sumOfAllItems: Double {
        let totalPrices = items.map(\.totalPrice)
        return totalPrices.reduce(0, +)
    }
    
    
    var body: some View {
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
                            }
                        }.padding([.leading,.trailing])
                        
                    } header: {
                        Text("successfully scanned, you can modify your tab below")
                            .font(.subheadline)
                            .listRowBackground(Color(.clear))
                            .listRowSeparator(.hidden)
                            .foregroundColor(.secondary)
                        
                    }.headerProminence(.increased)
                    
                    
                    ForEach($items, id: \.id) { $item in
                        billListRow(item: $item)
                            .swipeActions(edge: .trailing,allowsFullSwipe: true, content: {
                                Button {
                                    items.removeAll(where: {$0.id == $item.id})
                                } label: {
                                    Text("Delete")
                                        .foregroundColor(.white)
                                }
                                .tint(.red)

                            })
                            .swipeActions(edge: .trailing,allowsFullSwipe: false, content: {
                                Button {
                                    item.isEditing.toggle()
                                } label: {
                                    Text("Edit")
                                        .foregroundColor(.white)
                                }
                               .tint(.yellow)

                            })
                            
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.grouped)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Resume Tabs")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            var newItem = TabItem(name: "Please edit this item", quantity: 0, unitPrice: 0.0)
                            newItem.isEditing.toggle()
                            newItem.quantity = 1
                            items.append(newItem)
                        } label: {
                            Image(systemName: "text.badge.plus")
                        }
                    }
                }
                .background(Color.clear)
                TotalOverView(totalPrice: sumOfAllItems)
            }
    }
}

//struct BillListView_Previews: PreviewProvider {
//    static var previews: some View {
//
//    BillListView(items: $items)
//}

