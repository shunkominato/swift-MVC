//
//  WuthOutMP3.swift
//  Swift-MVC
//
//  Created by macbook on 2021/02/23.
//

import Foundation

class WithOutMP3:SoundFile {
    override func playSound(filename: String, extensionName: String) {
        if extensionName == "mp3" {
            print("このファイルは再生できません")
        }
        player?.stop()
    }
}
