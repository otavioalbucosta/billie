//
//  BillListView.swift
//  billie
//
//  Created by Otávio Albuquerque on 13/09/22.
//

import SwiftUI

struct BillListView: View {
    @State private var slide = 50.0
    @State private var isEditing = false
//    @State private var coisas: [billListRow] = []
    
    let alignment: Alignment = .bottom
    let width: CGFloat = 0.0
    let height: CGFloat = 0.0
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    let foodName = ["AGUACATE", "Vatermelon","EarthMelon","fireMelon", "Airmelon", "KITUTI", "MDS N TA DANDO"]
    @State var quantityRand = [1, 3, 2, 4, 2, 8, 3]
    @State var priceRand = [1, 30.2, 13.2, 4.9, 22.1, 18.0, 3.0]
    @State var value : Double = 0.0
    
    var body: some View {
        NavigationView{
            VStack{
                
                List {
                    Section{
                        Button {
                            // Takes to the data saved
                            // The photo taken if possible, otherwise take the header off. =D
                        } label: {
                            HStack {
                                Text("Conta")
                                Spacer()
                                Image(systemName: "photo")
                            }.foregroundColor(.primary)
                        }.padding([.leading,.trailing])
                        
                    } header: {
                        Text("Dados escaneados com sucesso, é possível modificar os dados na lista abaixo")
                            .font(.subheadline)
                            .listRowBackground(Color(.clear))
                            .listRowSeparator(.hidden)
                            .foregroundColor(.secondary)
                        
                    }.headerProminence(.increased)
                    
                    ForEach (0..<foodName.endIndex) { item in
                        billListRow(item: foodName[item], quantity: quantityRand[item], price: priceRand[item])
                            
                    }
                    
                    HStack{
                        Text("c/ taxa de serviço").foregroundColor(.secondary)
                        Spacer()
                        Image(systemName: "info.circle").foregroundColor(.secondary)
                        Text("44.28").foregroundColor(.secondary)
                    }
                    .listRowSeparator(.hidden)
                }.listStyle(.grouped)
                
                ZStack() {
                    HStack (alignment: .bottom){
                        Text("Subtotal da mesa: \(priceRand[0], specifier: "%.2f")")
                        Spacer()
                        Text("Seu total: \(priceRand[0], specifier: "%.2f")")
                    }
                }
                .frame(maxHeight: UIScreen.main.bounds.height/10)
                //                .background(Color.white).shadow(radius: 2, x: 0, y: -1)
                .ignoresSafeArea()
            }
            
        }
    }
}

struct BillListView_Previews: PreviewProvider {
    static var previews: some View {
        BillListView()
    }
}

func teste() {
    print("asdas")
}
