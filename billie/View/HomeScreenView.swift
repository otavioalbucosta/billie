import SwiftUI

struct HomeScreenView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var recognizedContent = RecognizedContent()
    @State var showScanner = false
    @State private var isRecognized: Bool = false
    @State var isEnded: Bool = false
    @State var items: [TabItem] = []
    @State var alertHelpButton = false
    @State var alertError = false
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .center) {
                
                ZStack(){
                    LottieView(isEnded: $isEnded, filename: "BillieMoneySupposedlyFinal")
                        .shadow(color: .indigo, radius: 2, x: 1, y: 2)
                }
                .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.midY)
                .ignoresSafeArea(.all)
                
                
                Button("") {
                    showScanner = true
                    let impactGen = UIImpactFeedbackGenerator(style: .medium)
                    impactGen.impactOccurred()
                }.buttonStyle(scanButton(isEnded: isEnded))
                
                Button("") {
                    isRecognized.toggle()
                }.buttonStyle(manualEnterButton(isEnded: isEnded))
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button() {
                        alertHelpButton = true
                    }label: {
                        Image(systemName: "questionmark.circle.fill")
                            .foregroundColor(Color.white)
                            .font(Font.body)
                            .padding(.all, 10)
                    }.alert(isPresented: $alertHelpButton) {
                        Alert(title: Text("Let me help you! 😃"),
                              message: Text("You can use Billie to scan you table's receipt, edit the itens or values, and send the payment to the restaurant on your phone. All in one simple app!"),
                              dismissButton: .default(Text("Ok, got it!")))
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(colorScheme == .light ? LinearGradient.backgroundGradientLight:
                            LinearGradient.backgroundGradientDark)
            .navigationDestination(isPresented: $isRecognized) {
                CheckView(itemData: $items)
            }
            .alert(isPresented: $alertError){
                Alert(title: Text("Scan error"),
                      message: Text("There was an error scanning your receipt, please try to frame only the important parts of the bill"),
                      dismissButton: .default(Text("Try again")))
            }
        }
        .accentColor(.actionColor)
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
                        self.items.removeAll()
                        self.items.append(contentsOf: res)
                        print(items)
                        if !items.isEmpty {
                            isRecognized.toggle()
                            
                        }else{
                            alertError.toggle()
                        }
                    }.recognizeText()
                case .failure(let error):
                    print(error.localizedDescription)
                    alertError.toggle()
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

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeScreenView()
    }
}
