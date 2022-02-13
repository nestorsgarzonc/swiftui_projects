import SwiftUI

struct ContentView: View {
    @State private var amount: String = ""
    @State private var tip:Int=0
    @State private var persons:Int=1
    
    let screenSize = UIScreen.main.bounds.size
    
    func onSelectTip(item:Int){
        tip=item
    }
    
    func onAddPersons(){
        persons+=1
    }
    
    func onLessPersons(){
        if persons > 1{
            persons-=1
        }
    }
    
    var body: some View {
        NavigationView{
            VStack(spacing:0){
                VStack{
                    CustomText(
                        text: "Enter bill total:"
                    )
                    TextField(
                        "e.g. 120.00",
                        text: $amount
                    )
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .keyboardType(.numberPad)
                        .foregroundColor(Color("GreenColor"))
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: screenSize.height*0.3, alignment: .center)
                .background(Color(.white))
                VStack{
                    CustomText(
                        text: "Select tip:"
                    ).padding(.vertical)
                    HStack(spacing:20){
                        TipButton(
                            label: 0,
                            onTap:onSelectTip,
                            selectedLabel: tip
                        )
                        TipButton(
                            label: 10,
                            onTap:onSelectTip,
                            selectedLabel: tip
                        )
                        TipButton(
                            label: 20,
                            onTap:onSelectTip,
                            selectedLabel: tip
                        )
                    }
                    CustomText(
                        text: "Choose split:"
                    ).padding(.vertical)
                    HStack(spacing:0){
                        Text("\(persons)")
                            .foregroundColor(Color("GreenColor"))
                            .font(.largeTitle)
                            .padding(.horizontal)
                        CounterButton(
                            label: "-", onTap: onLessPersons
                        )
                        CounterButton(
                            label: "+", onTap: onAddPersons
                        )
                    }
                    Spacer()
                    NavigationLink{
                        ResultScreen(
                            result: BillModel(
                                total: Double(amount) ?? 0,
                                tip: tip,
                                persons: persons
                            )
                        )
                    }label:{
                        Text("Calculate")
                            .font(.title2)
                            .frame(
                                minWidth: 0,  maxWidth: .infinity, minHeight: 0, maxHeight: 30
                            )
                            .padding()
                    }
                    .foregroundColor(Color("GreenColor"))
                    .padding()
                    .padding(.vertical)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: screenSize.height*0.7, alignment: .center)
                .background(Color("BackgroundColor"))
            }.ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
