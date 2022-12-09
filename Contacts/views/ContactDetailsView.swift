import SwiftUI
import PhotosUI


struct ContactDetailsView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @Binding var contact : Contact
    var default_image = "default-icon"
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 24) {
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()
            ){
                if let data = contact.imagePath {
                    Image(uiImage: UIImage(data: data)!)
                        .resizable()
                        .frame(width: 150.0, height: 150.0)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.cyan, lineWidth: 4)
                        )
                        .shadow(radius: 8)
                } else {
                    Image(default_image)
                        .resizable()
                        .frame(width: 150.0, height: 150.0)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.cyan, lineWidth: 4)
                        )
                        .shadow(radius: 8)
                }
                
            }.onChange(of: selectedItem){ newItem in
                Task{
                    if let data = try? await newItem?.loadTransferable(type: Data.self){
                        contact.imagePath = data
                    }
                }
            }
            HStack{
                            
                Section(header: Text("Name :").font(.title)) { TextField(
                    "Name",
                    text: $contact.name )
                    
                }.font(.title2).padding(10)
                
            }
            HStack{
                Section(header: Text("Number :").font(.title)) {
                    TextField( "Number",
                               text: $contact.phoneNumber)
                    .keyboardType(.numberPad)
                }
                
            }.font(.title2).padding(10)
        }.padding(20).navigationTitle(contact.name)
    }
}


struct ContactDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailsView(contact : .constant(Contact(name: "Marie Curie", phoneNumber:"0648481933")))
    }
}

extension StringProtocol {
    func separateer(every stride: Int = 4, from start: Int = 0, with separator: Character = " ") -> String {
        .init(enumerated().flatMap { $0 != 0 && ($0 == start || $0 % stride == start) ? [separator, $1] : [$1]})
    }
}
