import SwiftUI
import Firebase

@main
struct swift_chatApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            OnBoardingScreen()
        }
    }
}
