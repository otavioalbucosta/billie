//
//  TotalBarView.swift
//  billie
//
//  Created by Luciana Adrião on 27/09/22.
//

import SwiftUI

struct TotalOverlay: View {
    var sumTotalPrice: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                HStack{
                    Image(systemName: "person.fill")
                    Text("Total")
                    Spacer()
                    Text(sumTotalPrice, format: .currency(code: "BRL"))
                }
                .font(Font.title3.bold())
                HStack{
                    Image(systemName: "dollarsign.circle")
                    Text("10% Tip")
                    Spacer()
                    Text(sumTotalPrice*0.1, format: .currency(code: "BRL"))
                }
                .foregroundColor(.secondary)
            }.zIndex(0)
            SliderButton()
                .scenePadding([.top])
        }
        .padding(.all, 20)
    }
}

//struct TotalOverlay_Previews: PreviewProvider {
//
//    static var previews: some View {
//        
//        TotalOverlay(sumTotalPrice: 20)
//    }
//}
