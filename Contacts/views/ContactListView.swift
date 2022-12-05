import SwiftUI


struct ContactListView : View{
    @StateObject var repository = ContactRepository.shared

    

    
    var body: some View{
        List {
            ForEach($repository.contacts) {contact in
                NavigationLink(destination: ContactDetailsView(contact: contact)){
                    ContactView(contact: contact)
                }
            }.navigationTitle("Contacts")
        }
    }
}

