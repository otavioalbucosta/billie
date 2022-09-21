//
//  TotalOverView.swift
//  billie
//
//  Created by Luciana Adrião on 19/09/22.
//

import SwiftUI

struct TotalOverView: View {
    
    var totalPrice: Double
    
    var body: some View {
            VStack(alignment: .leading) {
                Group{
                    HStack{
                        Image(systemName: "person.fill")
                        Text("Seu total")
                        Spacer()
                        Text("R$ \(totalPrice, specifier: "%.2f")")
                    }
                    .font(Font.title3.bold())
                    Group {
                        HStack{
                            Image(systemName: "person.3")
                            Text("Taxa 10% ")
                            Spacer()
                            Text("R$ \(totalPrice*0.1, specifier: "%.2f")")
                        }
                        HStack{
                            Image(systemName: "star")
                            Text("Cover")
                            Spacer()
                            Text("R$ \(totalPrice, specifier: "%.2f")")
                        }
                    }.padding([.leading,.trailing],10).foregroundColor(.secondary)
                }
            }
    }
}

struct TotalOverView_Previews: PreviewProvider {
    static var previews: some View {
        TotalOverView(totalPrice: 20)
    }
}
