//
//  ContentView.swift
//  calculator
//
//  Created by Puntored on 28/01/22.
//

import SwiftUI

struct ContentView: View {
    @State var value:Double=0.0
    let screenSize = UIScreen.main.bounds.size
    
    func onClean(){}
    
    var body: some View {
        VStack(spacing:0){
            let height=screenSize.height-70
            let itemHeight=height/6
            let itemWidth=screenSize.width/4
            Text("\(value)")
                .frame(
                    maxWidth: .infinity,
                    maxHeight: 60,
                    alignment: .bottomTrailing
                )
                .font(.largeTitle)
                .padding()
            Spacer()
            HStack(spacing:0){
                CalculatorItem(
                    itemWidth: itemWidth, itemHeight: itemHeight,
                    onTap: {},
                    label: "AC",
                    color: Color("grayButtonColor")
                    
                )
                CalculatorItem(
                    itemWidth: itemWidth, itemHeight: itemHeight,
                    onTap: {},
                    label: "+/-",
                    color: Color("grayButtonColor")
                    
                )
                CalculatorItem(
                    itemWidth: itemWidth, itemHeight: itemHeight,
                    onTap: {},
                    label: "%",
                    color: Color("grayButtonColor")
                    
                )
                CalculatorItem(
                    itemWidth: itemWidth, itemHeight: itemHeight,
                    onTap: {},
                    label: "/",
                    color: Color("orangeButtonColor")
                    
                )
            }.frame(maxWidth: .infinity,
                    maxHeight: itemHeight)
            HStack(spacing:0){
                CalculatorItem(
                    itemWidth: itemWidth, itemHeight: itemHeight,
                    onTap: {},
                    label: "7",
                    color: Color("blueButtonColor")
                    
                )
                CalculatorItem(
                    itemWidth: itemWidth, itemHeight: itemHeight,
                    onTap: {},
                    label: "8",
                    color: Color("blueButtonColor")
                    
                )
                CalculatorItem(
                    itemWidth: itemWidth, itemHeight: itemHeight,
                    onTap: {},
                    label: "9",
                    color: Color("blueButtonColor")
                    
                )
                CalculatorItem(
                    itemWidth: itemWidth, itemHeight: itemHeight,
                    onTap: {},
                    label: "X",
                    color: Color("orangeButtonColor")
                    
                )
            }.frame(maxWidth: .infinity,
                    maxHeight: itemHeight)
            HStack(spacing:0){
                CalculatorItem(
                    itemWidth: itemWidth, itemHeight: itemHeight,
                    onTap: {},
                    label: "4",
                    color: Color("blueButtonColor")
                    
                )
                CalculatorItem(
                    itemWidth: itemWidth, itemHeight: itemHeight,
                    onTap: {},
                    label: "5",
                    color: Color("blueButtonColor")
                    
                )
                CalculatorItem(
                    itemWidth: itemWidth, itemHeight: itemHeight,
                    onTap: {},
                    label: "6",
                    color: Color("blueButtonColor")
                    
                )
                CalculatorItem(
                    itemWidth: itemWidth, itemHeight: itemHeight,
                    onTap: {},
                    label: "/",
                    color: Color("orangeButtonColor")
                )
            }.frame(maxWidth: .infinity,
                    maxHeight: itemHeight)
            HStack(spacing:0){
                CalculatorItem(
                    itemWidth: itemWidth, itemHeight: itemHeight,
                    onTap: {},
                    label: "1",
                    color: Color("blueButtonColor")
                    
                )
                CalculatorItem(
                    itemWidth: itemWidth, itemHeight: itemHeight,
                    onTap: {},
                    label: "2",
                    color: Color("blueButtonColor")
                    
                )
                CalculatorItem(
                    itemWidth: itemWidth, itemHeight: itemHeight,
                    onTap: {},
                    label: "3",
                    color: Color("blueButtonColor")
                    
                )
                CalculatorItem(
                    itemWidth: itemWidth, itemHeight: itemHeight,
                    onTap: {},
                    label: "/",
                    color: Color("orangeButtonColor")
                    
                )
            }.frame(maxWidth: .infinity,
                    maxHeight: itemHeight)
            HStack(spacing:0){
                CalculatorItem(
                    itemWidth: itemWidth*2, itemHeight: itemHeight,
                    onTap: {},
                    label: "0",
                    color: Color("blueButtonColor")
                    
                )
                CalculatorItem(
                    itemWidth: itemWidth, itemHeight: itemHeight,
                    onTap: {},
                    label: ".",
                    color: Color("blueButtonColor")
                    
                )
                CalculatorItem(
                    itemWidth: itemWidth, itemHeight: itemHeight,
                    onTap: {},
                    label: "=",
                    color: Color("orangeButtonColor")
                    
                )
            }
            .frame(maxWidth: .infinity,
                   maxHeight: itemHeight)
            Spacer()
            
        }
        .frame(minWidth: 0, maxWidth: screenSize.width, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(
            Color("backgroundColor")
        )
        .foregroundColor(.white)
    }
}

struct CalculatorItem: View{
    var itemWidth:Double
    var itemHeight:Double
    var onTap:()->Void
    var label:String
    var color:Color
    
    var body: some View{
        Button(
            action:onTap, label: {
                Text(label)
            }
        )
            .font(.title)
            .frame(
            width: itemWidth, height: itemHeight, alignment: .center
        )
            .background(color)
            .border(Color.black, width: 0.5)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
