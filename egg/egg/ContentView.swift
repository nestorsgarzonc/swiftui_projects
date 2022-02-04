//
//  ContentView.swift
//  egg
//
//  Created by Puntored on 3/02/22.
//

import SwiftUI

let softTime=5
let mediumTime=7
let hardTime=12

let timesPerLabel:[String:Int]=[
    "Soft": softTime,
    "Medium": mediumTime,
    "Hard": mediumTime
]

var secondsRemaining = 30

struct ContentView: View {
   
    @State var progressValue: Float = 0.0
    @State var title="How do you want your eggs?"
    
    func onSelectEgg(item:String){
        progressValue=0.0
        secondsRemaining=timesPerLabel[item]!
        title=item
        let step:Float=(100.0/Float(secondsRemaining))/100
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if secondsRemaining > 0 {
                    secondsRemaining -= 1
                    progressValue+=step
                } else {
                    playSound(key: "alarm_sound")
                    title="Done!"
                    Timer.invalidate()
                }
            }
        
    }
    
    let screenSize = UIScreen.main.bounds.size
    var body: some View {
        let itemWidth=(screenSize.width/3)-20
        VStack(alignment: .center){
            Spacer()
            Text(title)
                .padding()
                .foregroundColor(.gray)
                .font(.largeTitle)
            Spacer()
            HStack(spacing: 5){
                EggButton(
                    image:"soft_egg",
                    label: "Soft",
                    onTap: onSelectEgg,
                    width: itemWidth
                )
                EggButton(
                    image:"medium_egg",
                    label: "Medium",
                    onTap: onSelectEgg,
                    width: itemWidth
                )
                EggButton(
                    image:"hard_egg",
                    label: "Hard",
                    onTap: onSelectEgg,
                    width: itemWidth
                )
            }
            Spacer()
            ProgressBar(value: $progressValue).frame(height:20).padding()
            Spacer()
        }
        .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color("backgroundColor")
        )
    }
}

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor.systemBlue))
                    .animation(.linear)
            }.cornerRadius(45.0)
        }
    }
}

struct EggButton: View{
    let image:String
    let label: String
    let onTap: (String)->Void
    let width:Double
    
    var body: some View{
        Button(
            action:{
                onTap(label)
            }, label: {
                VStack{
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: width)
                    Text(label)
                        .font(.title2).foregroundColor(.black)
                }
            }
        ).padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
