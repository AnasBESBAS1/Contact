import SwiftUI


struct ContactListView : View{
    let repository = ContactRepository.shared
    let contacts : [Contact]
    
    init(){
        self.contacts = repository.contacts
    }
    
    var body: some View{
        List {
            ForEach(contacts) {contact in
                ContactView(contact: contact)
            }
        }
    }
}
