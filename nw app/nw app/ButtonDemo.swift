//
//  ButtonDemo.swift
//  nw app
//
//  Created by Puntored on 22/01/22.
//

import SwiftUI

struct ButtonDemo: View {
    var body: some View {
        Button(
            action: (){
                print("touched")
            }
        ){
            Text("First demo button")
        }
    }
}

struct ButtonDemo_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDemo()
    }
}
