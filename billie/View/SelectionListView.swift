//
//  SelectionListView.swift
//  billie
//
//  Created by Thaynara da Silva Andrade on 24/09/22.
//

import SwiftUI

struct SelectionListView: View {
    var body: some View {
        

                NavigationView {
                    List(pets) { pet in
                        SuperMultiSelectRow(pet: pet, selectionManager: self.$selectionManager)
                    }
                    .navigationBarItems(leading: Button(action: {
                        // code for change select mode
                        isMultiSelection.toggle()
                        self.selectionManager.allowsMultipleSelection = self.isMultiSelection
                    }, label: {
                        if self.isMultiSelection {
                            Text("Multi-Select").foregroundColor(Color.blue)
                        } else {
                            Text("Single-Select").foregroundColor(Color.red)
                        }
                    }))
                    .listStyle(InsetListStyle())
                    .navigationBarTitle(Text("Selected \(selectionManager.selections.count) rows"))
                }
            }
        
    }
}
struct SelectionListView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionListView()
    }
}
