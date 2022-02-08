import SwiftUI

struct LargeButton: View{
    let label: String
    let onTap: ()->Void
    var body: some View{
        Button(
            action: onTap, label: {
                Text(label)
                    .font(.title)
                    .frame(
                        minWidth: 0,  maxWidth: .infinity, minHeight: 0, maxHeight: 30
                    )
                    .padding()
                    .overlay(
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("PrimaryColor"), lineWidth: 3)
                    )
            }
        ).padding()
    }
}
