//
//  BillListView.swift
//  billie
//
//  Created by Otávio Albuquerque on 13/09/22.
//

import SwiftUI

struct BillListView: View {
    var body: some View {
        NavigationView{
            
            
            List {
                Section {
                    
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle(Text("Itens escaneados"))
        }
    }
}

struct BillListView_Previews: PreviewProvider {
    static var previews: some View {
        BillListView()
    }
}
