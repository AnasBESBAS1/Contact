import SwiftUI


struct ContactView: View {
    
    @Binding var contact: Contact
     var default_image = "default-icon"
    
    var body: some View {
        HStack(spacing: 20) {
            
            if let data = contact.imagePath {
                Image(uiImage : UIImage(data: data)!)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.cyan, lineWidth: 4)
                    )
                    .shadow(radius: 8)
            } else{
                Image(default_image)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.cyan, lineWidth: 4)
                    )
                    .shadow(radius: 8)
            }
            VStack(alignment: .leading){
                Text(contact.name)
                    .font(.title)
                Text(contact.phoneNumber.separate(every: 2, from: 0, with: " "))
                    .font(.title2)
                
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print(contact.name)
            print(contact.phoneNumber)
        }
    }
}

extension StringProtocol {
    func separate(every stride: Int = 4, from start: Int = 0, with separator: Character = " ") -> String {
        .init(enumerated().flatMap { $0 != 0 && ($0 == start || $0 % stride == start) ? [separator, $1] : [$1]})
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(contact : Binding.constant( Contact(name: "Marie Curie", phoneNumber:"06 48 48 19 33")))
    }
}
