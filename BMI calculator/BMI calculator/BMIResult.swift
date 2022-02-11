import SwiftUI

struct BMIResult: View {
    var bmi:Double
    
    var body: some View {
        ZStack{
            Image("calculate_background")
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            VStack{
                Spacer()
                Text("Your BMI is: ")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.7))
                    .padding()
                Text("\(bmi)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                Spacer()
            }
        }.ignoresSafeArea()
    }
}

struct BMIResult_Previews: PreviewProvider {
    static var previews: some View {
        BMIResult(bmi:20)
    }
}
