import SwiftUI
import CoreLocation

struct ContentView: View, WeatherDataDelegate {
    let locationManager=CLLocationManager()
    
    init() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func didFailWithError(error: Error?) {
        self.error=error
    }
    
    func didUpdateWeather(weather: WeatherModel) {
        city=weather.cityName
        temp=weather.tempString
        icon=weather.conditionName
    }
    
    @State private var error:Error?
    @State private var city: String = ""
    @State private var temp: String=""
    @State private var icon: String?
    
    func handleOnLocate(){
        print(locationManager.location)
    }
    
    func handleOnSearch(){
        WeatherManager(delegate: self).fetchWeather(cityName: city)
    }
    
    var body: some View {
        ZStack{
            BackgroundImageView()
            VStack(alignment: .trailing){
                HStack{
                    Button (action: handleOnLocate){
                        Image(systemName: "location.circle")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width:30, height:30)
                        
                    }
                    TextField(
                        "Search",
                        text: $city
                    )
                        .textFieldStyle(.roundedBorder)
                    Button(action: handleOnSearch){
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width:25, height:25)
                        
                    }
                }.padding()
                if error != nil {
                    Text("An error has ocurred")
                }
                if icon != nil && error == nil {
                    Image(systemName: icon!)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.horizontal)
                        .padding(.top)
                    Text("\(temp)° C")
                        .font(Font.system(size:70, weight: .bold))
                        .padding(.horizontal)
                    Text("\(city)")
                        .font(.largeTitle)
                        .padding(.horizontal)
                }
                Spacer()
            }
        }
    }
}

struct BackgroundImageView:View {
    var body: some View{
        Image("background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(
                minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center
            ).ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
