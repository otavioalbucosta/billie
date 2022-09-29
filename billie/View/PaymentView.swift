import SwiftUI

struct TestePaymentView: View {
    private var PaymentIndex = ["Dinheiro", "Pix",  "Apple pay"]
    @State private var selectedIndex = 0
    @State private var images: [Image] = [Image("IconMoney"), Image("IconPix"), Image("IconApplePay")]
    let alignment: Alignment = .bottom


    var body: some View {

        NavigationView {
            Form {
                Section("") {
                    Picker(selection: $selectedIndex,label: EmptyView()){
                        ForEach(0 ..< PaymentIndex.count) {
                            PickerRowView(image: images[$0], text: "\(PaymentIndex[$0])")
                        }
                   }
                }.pickerStyle(.inline)
               VStack {

                        Button {
                        } label: {


                            Text("Pagar com \(PaymentIndex[selectedIndex])")
                                .padding()
                                .foregroundColor(.white)
                                .background(.green)
                                .font(.title2)
                                .bold()
                                .cornerRadius(20)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                                .background(Color.clear)

                    }
                }
            }.listStyle(.sidebar)

            }
        }

    }

struct TestePaymentView_Previews: PreviewProvider {
    static var previews: some View {
        TestePaymentView()
    }
}
