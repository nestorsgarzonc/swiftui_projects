import Foundation
import CoreLocation

protocol PriceDataDelegate {
    func didUpdatePrice(price:PriceModel)
    func didFailWithError(error:Error?)
}

struct PriceManager {
    let weatherUrl="https://rest.coinapi.io/v1/exchangerate/BTC/"
    let apiKey="YOUR API KEY"
    
    var delegate:PriceDataDelegate?
    
    func fetchWeather(coin:String){
        let url="\(weatherUrl)\(coin)?apiKey=\(apiKey)"
        performRequest(urlString: url)
        delegate?.didFailWithError(error: nil)
    }
    
    func performRequest(urlString: String){
        if let url=URL(string: urlString){
            let urlSession=URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: urlSession) { data, urlResponse, error in
                if error != nil {
                    delegate?.didFailWithError(error:error!)
                    return
                }
                if let safeData=data{
                    if let price=self.parseJSON(priceData: safeData){
                        delegate?.didUpdatePrice(price:price)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(priceData:Data)->PriceModel?{
        let decoder=JSONDecoder()
        do{
            let decodedData = try decoder.decode(PriceData.self, from: priceData)
            let price=PriceModel(
                price: decodedData.rate,
                currency: decodedData.asset_id_quote
            )
            return price
        }catch{
            print("ERROR")
            print(error)
            delegate?.didFailWithError(error:error)
            return nil
        }
    }
}
