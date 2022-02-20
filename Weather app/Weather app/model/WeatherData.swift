import Foundation

struct WeatherData :Codable{
    let name:String
    let main:MainWeatherData
    let weather:[Weather]
}


struct MainWeatherData:Codable{
    let temp: Double
    let feels_like: Double
}

struct Weather: Codable{
    let description:String
    let id:Int
}
