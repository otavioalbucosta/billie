import SwiftUI

struct PickerRowView: View {
    @State var image: Image
    @State var text: String
    var body: some View {
        HStack{
            image
            Text(text)
        }
    }
}

struct PickerRowView_Previews: PreviewProvider {
    static var previews: some View {


        PickerRowView(image: Image(systemName: "checkbox"), text: "Teste")
    }
}
