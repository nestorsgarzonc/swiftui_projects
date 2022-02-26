import SwiftUI

struct ChatScreen: View{
    @State private var message: String = ""
    
    func handleOnLogout(){
        
    }
    
    func handleOnSendMessage(){
        
    }
    
    var body: some View {
        VStack{
            HStack(alignment: .center){
                LogoView()
                Spacer()
                Button(
                    action: handleOnLogout,
                    label: {
                        Text("Log Out")
                            .font(.title3)
                    }
                )
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 70, alignment: .trailing)
            .background(Color("BrandBlue"))
            .foregroundColor(.white)
            ScrollView{
                ForEach(0..<20) {
                    MessageItem(isMine: $0%2==0, message: "Bonjour X\(($0+1)*($0+2))")
                }
            }
            Spacer()
            HStack{
                TextField(
                    "Write a message",
                    text: $message
                )
                    .padding()
                    .foregroundColor(.white)
                    .textFieldStyle(.roundedBorder)
                Button(
                    action: handleOnSendMessage, label: {
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(.white)
                    }
                ).padding(.trailing)
            }
            .background(Color("BrandPurple"))
        }
    }
}

struct MessageItem:View{
    let isMine:Bool
    let message:String
    
    var body:some View{
        HStack{
            Text(isMine ? "You" : "Me")
                .frame(width: 60, height: 60, alignment: .center)
                .background(Color("BrandBlue").opacity(isMine ? 0.1: 1))
                .foregroundColor(isMine ? Color("BrandBlue") : .white.opacity(0.9))
                .cornerRadius(.infinity)
            Text(message)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60, alignment: .leading)
                .foregroundColor(isMine ? .white : Color("BrandPurple"))
                .background(Color("BrandPurple").opacity(isMine ? 1 : 0.15))
                .cornerRadius(14)
                .padding(.horizontal)
        }
        .environment(\.layoutDirection, isMine ? .leftToRight : .rightToLeft)
    }
}

struct LogoView:View {
    var body:some View{
        Image(systemName: "bolt")
            .resizable()
            .foregroundColor(.yellow)
            .frame(width: 35, height: 45)
        Text("FlashChat")
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}

struct ChatScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChatScreen()
    }
}
