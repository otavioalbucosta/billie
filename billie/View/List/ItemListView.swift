//
//  ItemListView.swift
//  billie
//
//  Created by Luciana Adrião on 27/09/22.
//

import SwiftUI


struct ItemListView: View {
    @Binding var items: [TabItem]
    @State private var isEditing = false
    
    var body: some View {
        let itemModel = TabItem()
        NavigationView {
            List {
                Section {
                    ForEach($items, id: \.id) { $item in
                        ItemBillCell(itemModel: $item)
                            .swipeActions(edge: .trailing,allowsFullSwipe: true, content: {
                                Button {
                                    items.removeAll(where: {$0.id == $item.id})
                                } label: {
                                    Text("Delete")
                                        .foregroundColor(.white)
                                }
                                .tint(.red)
                                
                            })
                            .swipeActions(edge: .trailing,allowsFullSwipe: true, content: {
                                Button {
                                    item.isEditing.toggle()
                                } label: {
                                    Text("Edit")
                                        .foregroundColor(.white)
                                }
                                .tint(.yellow)
                                
                            })
                    }
                } header: {
                    Text("successfully scanned, you can modify your tab below")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }.headerProminence(.increased)
            }
            .listStyle(.grouped)
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let newItem = itemModel.addNewItem()
                        items.append(newItem)
                    } label: {
                        Image(systemName: "text.badge.plus")
                    }
                }
            }
        }
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




