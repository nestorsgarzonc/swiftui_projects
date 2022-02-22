import SwiftUI

struct ContentView: View, PriceDataDelegate {
    func onInit() {
        let priceManager =  PriceManager(delegate: self)
        priceManager.fetchWeather(coin: selectedCurrency)
    }
    
    func didUpdatePrice(price: PriceModel) {
        self.price=price
    }
    
    func didFailWithError(error: Error?) {
        print(error)
        self.error=error
    }
    
    func onChange(_ currency:String){
        let priceManager =  PriceManager(delegate: self)
        priceManager.fetchWeather(coin: currency)
    }
    
    var coins = ["USD", "COP", "EUR", "ARS"]
    @State private var selectedCurrency = "COP"
    @State private var error:Error?
    @State private var price:PriceModel?
    
    var body: some View {
        VStack{
            Text("ByteCoin")
                .font(.system(size: 50))
                .foregroundColor(Color("Title Color"))
                .fontWeight(.light)
                .padding()
            HStack{
                Image(systemName: "bitcoinsign.circle.fill")
                    .resizable()
                    .frame(width: 70, height: 70, alignment: .center)
                if price != nil {
                    Text(price?.priceRounded ?? "-")
                    Text(price?.currency ?? "-")
                }
            }.foregroundColor(Color("Icon Color"))
                .padding(.horizontal,10)
                .padding(.vertical,8)
                .font(.title2)
                .background(Color("Title Color").opacity(0.4))
                .cornerRadius(20)
            Spacer()
            Picker("Please choose a color", selection: $selectedCurrency) {
                ForEach(coins, id: \.self) {
                    Text($0)
                }.onChange(of: selectedCurrency, perform: onChange)
            }.pickerStyle(WheelPickerStyle())
        }
        .frame(
            minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center
        )
        .background(Color("Background Color"))
        .onAppear{
            onInit()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
