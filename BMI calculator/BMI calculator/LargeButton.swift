
import SwiftUI

struct LargeButton: View{
    let label: String
    let onTap: ()->Void
    let color:Color
    
    var body: some View{
        Button(
            action: onTap, label: {
                Text(label)
                    .font(.title2)
                    .frame(
                        minWidth: 0,  maxWidth: .infinity, minHeight: 0, maxHeight: 30
                    )
                    .padding()
            }
        )
            .background(color)
            .cornerRadius(10)
            .padding(.vertical)
            .foregroundColor(.white)
    }
}
