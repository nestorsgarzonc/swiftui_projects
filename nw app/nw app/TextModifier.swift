//
//  TextModifier.swift
//  nw app
//
//  Created by Puntored on 21/01/22.
//

import SwiftUI

struct TextModifier: View {
    var body: some View {
        Text("Hellos!").font(.largeTitle).foregroundColor(.blue).padding()
            .frame(height: 100, alignment: .center)
            .background(.black)
    }
}

struct TextModifier_Previews: PreviewProvider {
    static var previews: some View {
        TextModifier()
    }
}
