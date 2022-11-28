import Foundation

class ContactRepository {
    static let shared = ContactRepository()
    var contacts = [
        Contact(name: "Marie Curie", phoneNumber: "0648481933"),
        Contact(name: "Pierre Curie", phoneNumber: "0785213698"),
        Contact(name: "Sophie Germain", phoneNumber: "0258586931"),
        Contact(name: "Alan Turing", phoneNumber: "0796321458")
    ] }

