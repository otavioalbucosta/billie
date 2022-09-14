//
//  SplashScreenView.swift
//  billie
//
//  Created by Pedro Muniz on 14/09/22.
//

import SwiftUI

struct SplashScreenView: View {
    
    var body: some View {
        
        ZStack { //embed here so a 2nd animation can come on top of the 1st
            LottieView(filename: "moneyNewVersion").frame(width: 500, height: 500)
            
            LottieView(filename: "billieLightMode")
                .frame(width: 400, height: 400)
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
