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
    
    let alignment: Alignment = .bottom
    let width: CGFloat = 0.0
    let height: CGFloat = 0.0
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationView{
                VStack{
                    List {
                        
                        Section{
                            Text("Comanda").foregroundColor(Color(red: 2/255, green: 69/255, blue: 122/255))
                        } header: {
                            Text("Dados escaneados com sucesso, é possível modificar os dados abaixo")
                                .font(.footnote)
                                .listRowBackground(Color(.clear))
                                .listRowSeparator(.hidden)
                                .foregroundColor(Color(red: 104/255, green: 104/255, blue: 104/255))
                        }.headerProminence(.increased)
                        Section{
                            billListRow(code: 0001, item: "Batata Frita", quantity: 5, price: 7.45, totalPrice: 7.45*5)
                            billListRow(code: 0002, item: "Itaipava 600ml", quantity: 1, price: 23.70, totalPrice: 2.50)
                            billListRow(code: 0003, item: "Bolinha de queijo", quantity: 2, price: 5.58, totalPrice: 112.43)
                            HStack{
                                Text("Subtotal").foregroundColor(.gray)
                                Spacer()
                                Text("40.28").foregroundColor(.gray)
                            }
                            HStack{
                                Text("c/ taxa de serviço").foregroundColor(.gray)
                                Spacer()
                                Image(systemName: "info.circle")
                                Text("44.28").foregroundColor(.gray)
                            }
                                .listRowSeparator(.hidden)
                        }
                        
                    }
                    .listStyle(.grouped)
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                            .background(.quaternary)
                            .shadow(color:.gray.opacity(0.3), radius: 2 ,x: 0,y: -2)
                        VStack{
                            HStack{
                                Text("Cover").foregroundColor(.gray)
                                Spacer()
                                Button {
                                    print("foi")
                                } label: {
                                    Image(systemName: "minus.circle").foregroundColor(Color(red: 2/255, green: 69/255, blue: 122/255))
                                }.padding(.trailing)
                                Button {
                                    
                                } label: {
                                    Image(systemName: "plus.circle").foregroundColor(Color(red: 2/255, green: 69/255, blue: 122/255))
                                }
                                Text("15.00").foregroundColor(.gray)
                                
                            }
                            HStack{
                                Text("Total da conta")
                                Spacer()
                                Text("59.31")
                            } 
                            .padding(.top, 5)
                            
                            

                        }
                        .padding(.bottom, 60)
                        .padding()
                        
                        Slider(value:  $slide, in: 0...100, onEditingChanged: { editing in
                            isEditing = editing
                        }).padding(.top, 70)
                        .padding()
                        
                    }
                    .edgesIgnoringSafeArea(.bottom)
                    .frame(width: screenWidth, height: screenHeight/5)
                    .frame(width: width, height: height, alignment: alignment)
                    
                    
                }
                .listStyle(.insetGrouped)
                .navigationTitle(Text("Conta"))
                .navigationBarTitleDisplayMode(.inline)


        }
    }
}

struct BillListView_Previews: PreviewProvider {
    static var previews: some View {
        BillListView()
    }
}
