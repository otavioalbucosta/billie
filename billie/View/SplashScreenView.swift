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
    @State private var isRecognized: Bool = false
    @State var isEnded: Bool = false
    @State var itens: [TabItem] = []
    @State var alertHelpButton = false
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .center) {
                
                ZStack(){ //embed here so a 2nd animation can come on top of the 1st
                    LottieView(isEnded: $isEnded, filename: "BillieMoneySupposedlyFinal")
                        .shadow(color: .indigo, radius: 2, x: 1, y: 2)
                }
                .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.midY)
                .ignoresSafeArea(.all)
                
                Button (action: {
                    showScanner = true
                    
                    let impactGen = UIImpactFeedbackGenerator(style: .medium)
                    impactGen.impactOccurred()
                    
                }){
                    HStack{
                        Image(systemName: "doc.text.viewfinder")
                        Text("Scan receipt")
                            .fontWeight(.semibold)
                            .font(Font.title3)
                    }
                    .foregroundColor(colorScheme == .dark ? .blue:
                                        Color(red: 36/255, green: 123/255, blue: 160/255))
                    .padding(.all, 12)
                    .padding([.leading,.trailing])
                    .opacity(isEnded ? 1
                             : 0).animation(.easeInOut(duration: 1), value: isEnded)
                        .background(.white
                        ).opacity(isEnded ? 1 : 0).animation(.easeOut(duration: 1), value: isEnded)
                    
                }
                .buttonStyle(GrowingButton()).animation(.easeOut(duration: 1), value: isEnded)
                
                
            }
            .toolbar {
                ToolbarItem {
                    Button() {
                        alertHelpButton = true
                        
                    }label: {
                        
                        Image(systemName: "questionmark.circle.fill")
                            .foregroundColor(Color.white)
                            .font(Font.body)
                            .padding(.all, 10)
                    } .alert(isPresented: $alertHelpButton) {
                        Alert(title: Text("Let me help you! 😃"),
                              message: Text("You can use Billie to scan you table's receipt, edit the itens or values, and send the payment to the restaurant on your phone. All in one simple app!"),
                              dismissButton: .default(Text("Ok, I got it!")))
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(colorScheme == .light ?
                        LinearGradient(gradient: Gradient(colors: [
                            Color.backgroundTopColor,
                            Color.backgroundBottomColor,
                            Color.backgroundBottomColor.opacity(0.7),]),
                                       startPoint: .top,
                                       endPoint: .bottom):
                            LinearGradient(gradient: Gradient(colors: [
                                .blue,
                                .clear]),
                                           startPoint: .top,
                                           endPoint: .bottom))
            .navigationDestination(isPresented: $isRecognized) {
                BillListView(items: $itens)
            }
        }
        .sheet(isPresented: $showScanner, content: {
            ScannerView { result in
                recognizedContent.items.removeAll()
                switch result {
                case .success(let scannedImages):
                    recognizedContent.items.removeAll()
                    TextRecognition(scannedImages: scannedImages,
                                    recognizedContent: recognizedContent) {
                        // Text recognition is finished, hide the progress indicator.
                        print("RESULTADO:")
                        print(recognizedContent.items[0].text)
                        print("REGEX:")
                        var res = RegexNF().RegexToItem(str: recognizedContent.items[0].text)
                        self.itens.removeAll()
                        self.itens.append(contentsOf: res)
                        print(itens)
                        if !itens.isEmpty {
                            isRecognized.toggle()
                        }
                    }.recognizeText()
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
                showScanner = false
                
                
                
            } didCancelScanning: {
                // Dismiss the scanner controller and the sheet.
                showScanner = false
                
                let cancelHap = UIImpactFeedbackGenerator(style: .rigid)
                cancelHap.impactOccurred()
            }
        })
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        
        SplashScreenView()
    }
}
