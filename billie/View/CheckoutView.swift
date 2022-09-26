//
//  SwiftUIView.swift
//  billie
//
//  Created by Otávio Albuquerque on 22/09/22.
//

import SwiftUI

struct CheckoutView: View {
    @FocusState private var isUsernameFocused : Bool
    @State private var username = "Random name"
    @State private var item = TabItem()
    
    var body: some View {
        VStack{
            HStack{
                TextField("R$ \(item.unitPrice,specifier: "%.2f")", text: $username)
                    .focused($isUsernameFocused)
                    .foregroundColor(item.unitPrice == 0.0 ? Color.red : Color.primary)
                Spacer()
                Button {
                    isUsernameFocused.toggle()

                } label: {
                    Image(systemName: "star")
                }
            }
            
        }.navigationTitle(Text("Sua conta:"))
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
