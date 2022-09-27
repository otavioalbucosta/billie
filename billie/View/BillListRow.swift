//
//  billListRow.swift
//  billie
//
//  Created by Otávio Albuquerque on 12/09/22.
//

import SwiftUI


enum Field{
    case name
    case unitPrice
}
struct billListRow: View {
    @Binding var item: TabItem
    @FocusState private var field: Field?
//    @Binding var isEditing: Bool
    var closure: (() -> Void)?
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    
    
    @State var isFocused: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack{
                if item.isEditing {
                    TextField("Edite o nome", text: $item.name)
                        .textFieldStyle(.roundedBorder)
                        .font(Font.title2.bold())
                        .lineLimit(1)
                        .padding([.trailing],15)
                        .focused($field, equals: .name)
                        
                }else{
                    Text(item.name)
                        .font(Font.title2.bold())
                        .lineLimit(1)
                        .padding([.trailing],15)
                }
                Spacer()
                Text("R$ \(Double(item.quantity)*(item.unitPrice), specifier: "%.2f")")
                    .font(Font.headline.bold())
                    .foregroundColor(Double(item.quantity)*item.unitPrice == 0.0 ? Color.red : Color.primary)
            }
            .padding([.bottom],5)
            HStack{
                if item.isEditing {
                    TextField("Edite o valor unitário", value: $item.unitPrice, formatter: formatter)
                        .foregroundColor(item.unitPrice == 0.0 ? Color.red : Color.primary)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(.roundedBorder)
                        .focused($field,equals: .unitPrice)

                }else{
                    Text("R$ \(item.unitPrice,specifier: "%.2f")")
                        .foregroundColor(item.unitPrice == 0.0 ? Color.red : Color.primary)
                }
                Spacer()
                Button {
                    // If value equals zero, delete the row.
                    if item.quantity == 0 {
                    } else {
                        item.quantity = item.quantity - 1
                    }
                } label: {
                    Image(systemName: "minus.circle")
                }
                Text("\(item.quantity)x")
                Button {
                    item.quantity = item.quantity + 1
                } label: {
                    Image(systemName: "plus.circle")
                }
                .buttonStyle(.borderless)
            }
            
        }
        
//        .sheet(isPresented: $item.isEditing){
//            VStack{
//                TextField("Nome do Item",text: $item.name)
//                    .textFieldStyle(.roundedBorder)
//                TextField("Valor Unitário", value: $item.unitPrice, formatter: formatter)
//                    .keyboardType(.decimalPad)
//                    .textFieldStyle(.roundedBorder)
//                Spacer()
//            }
//        }
    }
//    func updateitemName() {
//        item.name = newName
//        item.unitPrice = newUnitPrice
//    }
}

struct billListRow_Previews: PreviewProvider {
    static var previews: some View {
        
        billListRow(item:  .constant(TabItem()))
    }
}
