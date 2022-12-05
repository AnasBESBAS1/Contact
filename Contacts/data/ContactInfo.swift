import Foundation

struct Contact : Identifiable {
    let id = UUID()
    var name: String
    var phoneNumber: String
    var imagePath : String
}
