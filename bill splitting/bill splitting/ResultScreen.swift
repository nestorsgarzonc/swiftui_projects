import SwiftUI

struct ResultScreen: View {
    let result:BillModel
    
    var body: some View {
        VStack{
            Text("Result:")
            Text("For \(result.persons) persons")
            Text("An account for \(result.total)")
            Text("With a tip of \(result.tip)")
            Text("Every persons should pay: \(result.totalByPersons())")
        }
        .frame(
            minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center
        )
        .background(Color("BackgroundColor"))
        
    }
    
}

struct ResultScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResultScreen(
            result: BillModel(
                total: 120.0, tip: 10, persons: 4
            )
        )
    }
}
