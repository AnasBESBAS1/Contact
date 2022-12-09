import SwiftUI


struct ContactListView : View{
    @StateObject var repository = ContactRepository.shared

    

    
    var body: some View{
        VStack{
            List {
                ForEach($repository.contacts) {contact in
                    NavigationLink(destination: ContactDetailsView(contact: contact)){
                        ContactView(contact: contact)
                    }
                }.navigationTitle("Contacts")
                
            }
            
            HStack(alignment: .lastTextBaseline ){
                Button(action: {
                    repository.contacts.append(Contact(name: "New user", phoneNumber: "0000000000"))
                    
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.cyan)
                        .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
                }
            }
        }
        
        
    }
}

