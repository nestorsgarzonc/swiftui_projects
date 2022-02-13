import SwiftUI

struct TipButton: View{
    let label: Int
    let onTap: (Int)->Void
    let selectedLabel: Int
    
    var body: some View{
        Button(
            action: {
                onTap(label)
            }, label: {
                Text("\(label)%")
                    .font(.largeTitle)
                    .frame(minHeight: 0, maxHeight:20)
                    .padding()
            }
        )
            .background(
                label == selectedLabel ?
                Color("GreenColor") : Color("BackgroundColor")
            )
            .cornerRadius(10)
            .foregroundColor(
                label == selectedLabel ?
                    .white: Color("GreenColor")
            )
    }
}
