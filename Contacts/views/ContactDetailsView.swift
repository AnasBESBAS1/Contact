import SwiftUI
import PhotosUI


struct ContactDetailsView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @Binding var contact : Contact
    var body: some View {

        VStack(alignment: .center) {
            
            Image(contact.imagePath)
                
                .resizable()
                .frame(width: 150.0, height: 150.0)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.red, lineWidth: 4)
                )
                .shadow(radius: 8)
                .onTapGesture {
                   print(contact.name)
                }
                HStack{
                Section(header: Text("Name").font(.headline)) { TextField(
                    "Name",
                
                    text: $contact.name )
                    
                }.font(.title).padding(10)
                
            }
            HStack{
                Section(header: Text("Number").font(.headline)) {
                    TextField( "Number",
                               text: $contact.phoneNumber)
                    .keyboardType(.numberPad)
                }
                
            }.font(.title).padding(10)
            Spacer()
        }.padding(20).navigationTitle(contact.name)
    }
}


struct ContactDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailsView(contact : .constant(Contact(name: "Marie Curie", phoneNumber:"0648481933", imagePath: "default-icon")))
    }
}

extension StringProtocol {
    func separateer(every stride: Int = 4, from start: Int = 0, with separator: Character = " ") -> String {
        .init(enumerated().flatMap { $0 != 0 && ($0 == start || $0 % stride == start) ? [separator, $1] : [$1]})
    }
}
