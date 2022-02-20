import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temp:Double
    var tempString:String{
        String(format: "%.1f", temp)
    }
    
    var conditionName:String{
        switch conditionId {
        case 200...299:
            return "cloud.bolt"
        case 300...399:
            return "cloud.drizzle"
        case 500...599:
            return "cloud.rain"
        case 600...699:
            return "cloud.snow"
        case 700...799:
            return "cloud.fog"
        case 800:
            return "cloud.max"
        case 801...899:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
