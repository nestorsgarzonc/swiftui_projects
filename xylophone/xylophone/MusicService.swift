//
//  MusicService.swift
//  xylophone
//
//  Created by Puntored on 30/01/22.
//

import Foundation
import AVKit

var player: AVAudioPlayer!

func playSound(key: String){
    print("Searhing: \(key)")
    let url=Bundle.main.url(
        forResource: key,
        withExtension: "wav",
        subdirectory: "Sounds"
    )
    guard url != nil else{
        print("Dont found :c")
        return
    }
    do{
        player=try AVAudioPlayer(contentsOf: url!)
        player?.play()
    }catch{
        print("Error")
    }
}
