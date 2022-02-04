//
//  ContentView.swift
//  xylophone
//
//  Created by Puntored on 29/01/22.
//

import SwiftUI

struct ContentView: View {
    func onPlay(item:String){
        playSound(key: item)
    }
    
    let screenSize = UIScreen.main.bounds.size
    var body: some View {
        
        VStack{
            XylophoneButton(
                width: screenSize.width, height: itemSize,
                color: Color.red,
                onTap: onPlay,
                title: "C"
            )
            XylophoneButton(
                width: screenSize.width-5, height: itemSize,
                color: Color.blue,
                onTap: onPlay,
                title: "D"
            )
            XylophoneButton(
                width: screenSize.width-10, height: itemSize,
                color: Color.green,
                onTap: onPlay,
                title: "E"
            )
            XylophoneButton(
                width: screenSize.width-15, height: itemSize,
                color: Color.brown,
                onTap: onPlay,
                title: "F"
            )
            XylophoneButton(
                width: screenSize.width-20, height: itemSize,
                color: Color.cyan,
                onTap: onPlay,
                title: "G"
            )
            XylophoneButton(
                width: screenSize.width-25, height: itemSize,
                color: Color.indigo,
                onTap: onPlay,
                title: "A"
            )
            XylophoneButton(
                width: screenSize.width-30, height: itemSize,
                color: Color.orange,
                onTap: onPlay,
                title: "B"
            )
        }.foregroundColor(.white)
    }
}

struct XylophoneButton: View{
    let width:Double
    let height:Double
    let color:Color
    let onTap: (String)->Void
    let title: String
    
    var body: some View{
        Button(action: {
            onTap(title
            )
        }, label: {
            Text(title).font(.largeTitle)
        })
            .frame(
                minWidth: 0,
                maxWidth: width, minHeight: 0, maxHeight: height, alignment: .center
            )
            .background(color)
            .buttonStyle(.borderless)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
