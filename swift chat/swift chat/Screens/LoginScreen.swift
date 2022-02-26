import SwiftUI
import FirebaseAuth

struct LoginScreen: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var error:Error?
    
    func handleOnLogin(){
        error=nil
        Auth.auth().signIn(withEmail: username, password: password) {
            (result, error) in
            if error != nil {
                self.error=error
                print(error?.localizedDescription ?? "")
            } else {
                print("success")
            }
        }
    }
    
    
    var body: some View {
        VStack{
            TextField(
                "User name (email address)",
                text: $username
            )
                .textInputAutocapitalization(.never)
                .font(.title)
                .padding()
            SecureField(
                "Password",
                text: $password
            )
                .font(.title)
                .padding(.horizontal)
            if error != nil{
                Text(error!.localizedDescription)
            }
            Spacer()
            Button(action: handleOnLogin, label: {
                Text("Log In")
                    .font(.largeTitle)
            })
                .foregroundColor(.white)
        }
        .background(Color("BrandBlue"))
        .textFieldStyle(.roundedBorder)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
