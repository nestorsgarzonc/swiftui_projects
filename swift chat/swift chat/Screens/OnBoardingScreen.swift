import SwiftUI

struct OnBoardingScreen: View {
    func handleOnLogin(){}
    func handleOnRegister(){}
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                HStack{
                    Image(systemName: "bolt")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 40, height: 50)
                    Text("FlashChat")
                        .foregroundColor(Color("BrandBlue"))
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                }
                Spacer()
                NavigationLink{
                    RegisterScreen()
                }
                
            label:{
                Text("Register")
                    .font(.largeTitle)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 65, alignment: .center)
            .background(Color("BrandBlue").opacity(0.2))
            .foregroundColor(Color("BrandBlue"))
            .padding(.horizontal)
                NavigationLink{
                    LoginScreen()
                }
            label: {
                Text("Log In")
                    .font(.largeTitle)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 65, alignment: .center)
            .background(Color("BrandBlue"))
            .foregroundColor(.white.opacity(0.8))
            .padding()
            }
        }
    }
}

struct OnBoardingScreen_Preview: PreviewProvider {
    static var previews: some View {
        OnBoardingScreen()
    }
}

