import SwiftUI

struct ContentView: View {
    @State private var height = 1.56
    @State private var weight = 45.0
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("calculate_background")
                    .resizable()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                VStack(){
                    Spacer()
                    Text("CALCULATE YOUR BMI")
                        .font(.system(size:40))
                        .fontWeight(.bold)
                        .foregroundColor(.black.opacity(0.6))
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .padding()
                    Spacer()
                    HStack(alignment: .center){
                        Text("Height")
                        Spacer()
                        Text("\(String(format: "%.2f", height))m")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth:.infinity, alignment: .center)
                    .padding(.horizontal)
                    Slider(
                        value: $height,
                        in: 0...2,
                        step: 0.05
                    )
                        .accentColor(.purple)
                        .padding()
                    HStack(alignment: .center){
                        Text("Weight")
                        Spacer()
                        Text("\(String(format: "%.0f", weight))Kg")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth:.infinity, alignment: .center)
                    .padding(.horizontal)
                    Slider(
                        value: $weight,
                        in: 0...180,
                        step: 1
                    ).accentColor(.purple)
                        .padding(.horizontal)
                    NavigationLink{
                        BMIResult(
                            bmi: weight/(height*height)
                        )
                    }label:{
                        Text("Calculate")
                            .font(.title2)
                            .frame(
                                minWidth: 0,  maxWidth: .infinity, minHeight: 0, maxHeight: 30
                            )
                            .padding()
                    }
                        .foregroundColor(.purple)
                        .padding()
                        .padding(.vertical)
                    
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            }.ignoresSafeArea()
        }
        .navigationTitle("Home")
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
