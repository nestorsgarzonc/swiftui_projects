import SwiftUI

struct ContentView: View {
    @State var node: Node=Stories().startNode
    
    func handleOnTrue(){
        if node.hasChilren(){
            node=node.children[0]
        }
    }
    func handleOnFalse(){
        if node.hasChilren(){
            node=node.children[1]
        }
    }
    
    func handleOnRestart(){
        node=Stories().startNode
    }
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            VStack{
                Spacer()
                Text(node.value.title).font(.title2).padding()
                Spacer()
                if node.value.choice1 != nil{
                LargeButton(
                    label: node.value.choice1!, onTap: handleOnTrue, color: Color("redColor")
                )}
                if node.value.choice1 != nil{
                LargeButton(
                    label: node.value.choice2!, onTap: handleOnFalse, color: Color("purpleColor")
                ).padding(.vertical)
                    .padding(.bottom)
            }
                if node.value.choice1 == nil{
                    LargeButton(
                        label: "Start again!", onTap: handleOnRestart, color: Color("purpleColor")
                    ).padding(.vertical)
                        .padding(.bottom)
                    
                }
                
            }
        }.ignoresSafeArea().foregroundColor(.white)
    }
}

struct LargeButton: View{
    let label: String
    let onTap: ()->Void
    let color:Color
    
    var body: some View{
        Button(
            action: onTap, label: {
                Text(label)
                    .font(.title3)
                    .frame(
                        minWidth: 0,  maxWidth: .infinity, minHeight: 0, maxHeight: 40
                    )
                    .padding()
            }
        )
            .background(color)
            .cornerRadius(20)
            .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
