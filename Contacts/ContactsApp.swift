import SwiftUI

@main
struct ContactsApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContactListView()
            }
            
        }
    }
}
