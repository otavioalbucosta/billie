//
//  SplashScreenView.swift
//  billie
//
//  Created by Pedro Muniz on 14/09/22.
//

import SwiftUI

struct SplashScreenView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var recognizedContent = RecognizedContent()
    @State var showScanner = false
    @State private var isRecognized: Bool? = false
    @State var isEndedFirst: Bool = false
    @State var isEndedLast: Bool = false
    
    var body: some View {
        NavigationView{
            VStack {
                ZStack { //embed here so a 2nd animation can come on top of the 1st
                    LottieView(isEnded: $isEndedFirst, filename: "moneyNewVersion").frame(width: 500, height: 500)
                    
                    LottieView(isEnded: $isEndedLast, filename: "billieLightMode")
                        .frame(width: 400, height: 400)

                    }
                Spacer()
                Button {

                    showScanner = true
                } label: {
                    Text("Iniciar escaneamento!").opacity(isEndedLast ? 1 : 0)
                        .foregroundColor( colorScheme == .dark ? .white : .black)
                }
                Spacer()
            }
        }
        .sheet(isPresented: $showScanner, content: {
            ScannerView { result in
                switch result {
                    case .success(let scannedImages):
                        
                        TextRecognition(scannedImages: scannedImages,
                                        recognizedContent: recognizedContent) {
                            // Text recognition is finished, hide the progress indicator.
                            isRecognized = true
                            print("RESULTADO:")
                            print(recognizedContent.items[0].text)
                            print("REGEX:")
                            let match = recognizedContent.items[0].text.matches(of: RegexNF.reg)
                            for matches in match {
                                let (_, codigo, produto, quantidade, valor, total) = matches.output
                                print(codigo)
                                print(produto)
                                print(quantidade)
                                print(valor)
                                print(total)
                            }
                        }
                        .recognizeText()
                        
                    case .failure(let error):
                        print(error.localizedDescription)
                }
                
                showScanner = false
                
            } didCancelScanning: {
                // Dismiss the scanner controller and the sheet.
                showScanner = false
            }
        })
        
        
    }
        
}
        


struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {

        SplashScreenView()
    }
}
