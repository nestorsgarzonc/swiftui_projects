import Foundation

struct BillModel{
    let total:Double
    let tip:Int
    let persons:Int
    
    func totalByPersons()->Double{
        if tip == 0 {
            return total / Double(persons)
        }
        return ((total * Double(tip) / 100)+total)/Double(persons)
    }
}
