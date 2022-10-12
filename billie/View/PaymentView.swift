import SwiftUI

struct PaymentView: View {
    @Environment(\.dismiss) private var dismiss
     var PaymentIndex = ["Cash", "Pix",  "Apple pay"]
    @State var selectedIndex = 0
    @State  var images: [Image] = [Image("IconMoney"), Image("IconPix"), Image("IconApplePay")]
    let alignment: Alignment = .bottom
    @State var alertButton = false
    @Binding var shouldPop: Bool
    
    
    
    var body: some View {
        
            
        ZStack(alignment: .bottom) {
            NavigationStack{
                Form {
                    Section("") {
                        Picker(selection: $selectedIndex,label: EmptyView()){
                            ForEach(0 ..< PaymentIndex.count) {
                                if $0 < 1 {
                                    PickerRowView(image: images[$0], text: "\(PaymentIndex[$0])")
                                } else {
                                    PickerRowView(image: images[$0], text: "\(PaymentIndex[$0])").foregroundColor(.gray)
                                }
                            }
                        }
                        .accentColor(selectedIndex > 0 ? Color.clear : Color.actionColor)
                    }.pickerStyle(.inline)
                        .onChange(of: selectedIndex, perform: { _ in
                            selectedIndex > 0 ? alertButton.toggle(): nil
                        })
                        .alert(isPresented: $alertButton) {
                            Alert(title: Text("This payment method isn't available yet"),
                                  message: Text("Sorry! Our team is working to make this feature available as soon as possible."),
                                  dismissButton: .default(Text("Ok")))
                        }
                    
                }
                .listStyle(.sidebar)
                
                if selectedIndex > 0 {
                    //
                } else {
                    Button {
                        shouldPop.toggle ()
                        dismiss()
                    } label: {
                        Text("Pay with \(PaymentIndex[selectedIndex])")
                            .padding([.leading, .trailing], 20).padding(.all)
                            .foregroundColor(.white)
                            .font(.title2.bold())
                            .background(selectedIndex > 0 ? Color(UIColor.gray): Color(UIColor.systemGreen))
                            .cornerRadius(20)
                        
                    }
                }
            }
        }
    }
}

struct TestePaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView(shouldPop: .constant(false))
    }
}


//Button {
//} label: {
//    Text("Pagar com \(PaymentIndex[selectedIndex])")
//        .padding()
//        .foregroundColor(.white)
//        .background(.green)
//        .font(.title2)
//        .bold()
//        .cornerRadius(20)
//        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
//        .background(Color.clear)
//}
