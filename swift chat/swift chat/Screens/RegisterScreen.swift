import SwiftUI
import FirebaseAuth

struct RegisterScreen: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var error:Error?
    
    func handleOnRegister(){
        Auth.auth().createUser(
            withEmail: username,
            password: password) {
                authResult, error in
                if error != nil {
                    self.error=error
                }
                print(authResult)
        }
    }
    
    var body: some View {
        NavigationView{
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
                if error != nil {
                    Text("Oops, an error has occured")
                    Text("\(error!.localizedDescription)")
                }
                Spacer()
                Button(action: handleOnRegister, label: {
                    Text("Register")
                        .font(.largeTitle)
                })
                    .foregroundColor(.white)
                    .padding()
            }
            .background(Color("BrandBlue"))
            .textFieldStyle(.roundedBorder)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
