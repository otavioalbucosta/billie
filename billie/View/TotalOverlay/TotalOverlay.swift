//
//  TotalBarView.swift
//  billie
//
//  Created by Luciana Adrião on 27/09/22.
//

import SwiftUI

struct TotalOverlay: View {
    var sumTotalPrice: Double
    @Binding var slideSuceeded: Bool
    
    var body: some View {
        let itemModel = TabItem()
        
        VStack(alignment: .leading) {
            Group {
                HStack{
                    Image(systemName: "person.fill")
                    Text("Total")
                    Spacer()
                    Text(sumTotalPrice, format: .currency(code: itemModel.localeCode))
                }
                .font(.TotalOverlayFont)
                HStack{
                    Image(systemName: "dollarsign.circle")
                    Text("10% Tip")
                    Spacer()
                    Text(sumTotalPrice*0.1, format: .currency(code: itemModel.localeCode))
                }
                .foregroundColor(.secondary)
            }
            SliderButton(success: $slideSuceeded)
                .scenePadding([.top])
        }
        .padding([.leading, .trailing, .top], 20)
    }
}

//struct TotalOverlay_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        
//        TotalOverlay(sumTotalPrice: 20, slideSuceeded: .constant(false))
//    }
//}
