//
//  BillListView.swift
//  billie
//
//  Created by Otávio Albuquerque on 13/09/22.
//
//  File currently not in use

import SwiftUI
import Foundation

struct BillListView: View {
    @State private var slide = 50.0
    @State private var isEditing = false
    @Binding var items: [TabItem]
    @State var slideSuceeded: Bool = false
    
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
        ZStack(alignment: .top){
            GeometryReader{ _ in
                List {
                    Section{
                        
                    } header: {
                        Text("The scanning was successful! You can edit your receipt below if you want to")
                            .font(.subheadline)
                            .listRowBackground(Color(.clear))
                            .listRowSeparator(.hidden)
                            .foregroundColor(.secondary)
                        
                    }.headerProminence(.increased)
                    
                    
                    ForEach($items, id: \.id) { $item in
                        billListRow(item: $item)
                            .buttonStyle(.plain)
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
                                    print(UIScreen.main.bounds.height/9)
                                    
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
                .navigationTitle("Here is your receipt")
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
            }
            .frame(maxHeight:UIScreen.main.bounds.height - UIScreen.main.bounds.height/3.5, alignment: .top)
            
            TotalOverView(totalPrice: sumOfAllItems, slideSuceeded: $slideSuceeded)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea(.keyboard)
            
        }
        .navigationBarBackButtonHidden(true)
        .scrollDismissesKeyboard(.interactively)
        .sheet(isPresented: $slideSuceeded){
            CheckoutView(totalPrice: sumOfAllItems)
        }
        
        
    }
//        .navigationBarBackButtonHidden(true)
//        .scrollDismissesKeyboard(.interactively)
}


struct BillListView_Previews: PreviewProvider {
    @State static var items: [TabItem] = [
        TabItem(),
        TabItem()
    ]
    
    static var previews: some View {
        
        BillListView(items: $items)
    }
}
