import SwiftUI


struct ContactView: View {
    
    let contact: Contact
    var body: some View {
        HStack {
            Image(systemName: "photo")
            VStack(alignment: .leading){
                Text(contact.name)
                    .font(.largeTitle)
                Text(contact.phoneNumber)
                    .font(.largeTitle)
                    
            }
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(contact : Contact(name: "Marie Curie", phoneNumber:"06 48 48 19 33" ))
    }
}
