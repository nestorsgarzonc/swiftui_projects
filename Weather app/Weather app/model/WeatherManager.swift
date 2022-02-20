import Foundation
import CoreLocation

protocol WeatherDataDelegate {
    func didUpdateWeather(weather:WeatherModel)
    func didFailWithError(error:Error?)
}

struct WeatherManager {
    let weatherUrl="https://api.openweathermap.org/data/2.5/weather?appid=3ec20458079762f57a52d0f8bbea0935"
    
    func fetchWeather(cityName:String){
        let url="\(weatherUrl)&q=\(cityName)"
        performRequest(urlString: url)
        delegate?.didFailWithError(error: nil)
    }
    
    var delegate:WeatherDataDelegate?
    
    func performRequest(urlString: String){
        if let url=URL(string: urlString){
            let urlSession=URLSession( configuration: .default)
            let task=urlSession.dataTask(with: url) { data, urlResponse, error in
                if error != nil {
                    delegate?.didFailWithError(error:error!)
                    return
                }
                if let safeData=data{
                    if let weather=self.parseJSON(weatherData: safeData){
                        delegate?.didUpdateWeather(weather:weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData:Data)->WeatherModel?{
        let decoder=JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let weather=WeatherModel(
                conditionId: decodedData.weather.first?.id ?? 100,
                cityName: decodedData.name,
                temp: decodedData.main.temp
            )
            return weather
        }catch{
            delegate?.didFailWithError(error:error)
            return nil
        }
    }
}
