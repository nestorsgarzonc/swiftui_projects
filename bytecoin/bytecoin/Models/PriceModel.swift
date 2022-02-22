import Foundation

struct PriceModel {
    let price:Double
    let currency: String
    var priceRounded:String{
        String(format: "%.2f", price)
    }
}
