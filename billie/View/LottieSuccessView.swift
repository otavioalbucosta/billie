//
//  LottieSucessView.swift
//  billie
//
//  Created by Thaynara da Silva Andrade on 23/09/22.
//

import SwiftUI

struct LottieSucessView: View {
    @Environment(\.dismiss) private var dismiss

    
    @State var isEndedFirst: Bool = true
    
    var body: some View {
        ZStack {
            LottieView(isEnded: $isEndedFirst, filename: "success")
                
        }
        .navigationBarBackButtonHidden(true)
        .onChange(of: isEndedFirst) { newValue in
            dismiss()
        }
    }
    
    struct LottieSucess_Previews: PreviewProvider {
        static var previews: some View {
            LottieSucessView()
        }
    }
}
