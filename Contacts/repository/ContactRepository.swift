import Foundation

class ContactRepository : ObservableObject{
    static let shared = ContactRepository()
    @Published var contacts = [
        Contact(name: "Marie Curie", phoneNumber: "0648481933", imagePath: "default-icon"),
        Contact(name: "Pierre Curie", phoneNumber: "0785213698", imagePath: "default-icon"),
        Contact(name: "Sophie Germain", phoneNumber: "0258586931", imagePath: "default-icon"),
        Contact(name: "Alan Turing", phoneNumber: "0796321458", imagePath: "default-icon"),
        Contact(name: "Alan Turing", phoneNumber: "0796321458", imagePath: "default-icon"),
    ] }

