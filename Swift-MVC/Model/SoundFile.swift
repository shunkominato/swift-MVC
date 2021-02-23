//
//  SoundFile.swift
//  Swift-MVC
//
//  Created by macbook on 2021/02/23.
//

import Foundation
import AVFoundation

class SoundFile {
    var player:AVAudioPlayer?
    func playSound(filename:String,extensionName:String){
        let soundURL = Bundle.main.url(forResource: filename,withExtension: extensionName)
        do{
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.play()
        
        } catch {
            print("error")
        }
    }
    

}
