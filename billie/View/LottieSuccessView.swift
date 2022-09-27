//
//  LottieSucessView.swift
//  billie
//
//  Created by Thaynara da Silva Andrade on 23/09/22.
//

import SwiftUI

struct LottieSucessView: View {
    
    @State var isEndedFirst: Bool = false
    
    var body: some View {
        ZStack {
            LottieView(isEnded: $isEndedFirst, filename: "Success")
        }
    }
    
    struct LottieSucess_Previews: PreviewProvider {
        static var previews: some View {
            LottieSucessView()
        }
    }
}
