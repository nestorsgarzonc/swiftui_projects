import SwiftUI

struct CustomText:View {
    let text:String
    var body:some View{
        Text(text)
            .font(.title2)
            .foregroundColor(.black.opacity(0.4))
            .fontWeight(.semibold)
            .frame(
                minWidth:0,
                maxWidth: .infinity,
                alignment: .leading
            ).padding()
    }
}
