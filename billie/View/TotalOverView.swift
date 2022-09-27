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
        ZStack(alignment: .center) {
            VStack(alignment: .leading) {
                Group {
                    Group{
                        HStack{
                            Image(systemName: "person.fill")
                            Text("Total")
                            Spacer()
                            Text("R$ \(totalPrice, specifier: "%.2f")")
                        }
                        .font(Font.title3.bold())
                        Group {
                            HStack{
                                Image(systemName: "dollarsign.circle")
                                Text("10% Tip")
                                Spacer()
                                Text("R$ \(totalPrice*0.1, specifier: "%.2f")")
                            }
                        }
                        .foregroundColor(.secondary)
                    }
                    
                    SliderButton()
                }.zIndex(0)
                    .ignoresSafeArea(.keyboard)
            }
            .padding(.all, 20)
            .ignoresSafeArea(.keyboard)
            Spacer()
            Rectangle()
                .ignoresSafeArea(.keyboard)
                .foregroundColor(Color(UIColor.systemGroupedBackground))
                .shadow(radius: 4)
                .zIndex(-1)

        }
        .ignoresSafeArea(.keyboard)
    }
}

struct TotalOverView_Previews: PreviewProvider {
    static var previews: some View {
        TotalOverView(totalPrice: 20)
    }
}
