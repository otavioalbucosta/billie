//
//  SwiftUIView.swift
//  billie
//
//  Created by Thaynara Andrade on 23/09/22.
//

import SwiftUI

struct CheckoutView: View {
    var totalPrice: Double
    var tip: Double {
        get{
            return totalPrice*0.1
        }
    }
    
    var body: some View {
        VStack{
            Spacer(minLength: 20)
            Section(header: Text("Formas de pagamento")
                .bold()
                .font(.title3)
            ){
                
                List{
                    Label ( "Pix", image: "IconPix")
                    Label ( "Dinheiro", image: "IconMoney")
                    Label ( "Apple pay", image: "IconApplePay")
                    Label ( "Add forma de pagamento", systemImage: "plus")
                    
                }
                Spacer(minLength: 20)
                
            }
            HStack{
                Button {
                    // nada
                } label: {
                    Text("Fazer pagamento")
                        .padding()
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(20)
                        .bold()
                        .buttonStyle(.plain)
                }
            }
        }.navigationTitle("")
    }
}
struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(totalPrice: 100)
    }
}
