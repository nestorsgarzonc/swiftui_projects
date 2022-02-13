import SwiftUI

struct CounterButton: View{
    let label:String
    let onTap: ()->Void
    
    var body: some View{
        Button(
            action: onTap, label: {
                Text(label)
                    .font(.title)
                    .frame(maxWidth:50)
            }
        )
            .background(
                .black.opacity(0.05)
            )
            .cornerRadius(4)
            .foregroundColor(
                .black.opacity(0.6)
            )
    }
}
