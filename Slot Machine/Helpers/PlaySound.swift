//
//  PlaySound.swift
//  Slot Machine
//
//  Created by TI Digital on 20/07/21.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String)
{
    if let path = Bundle.main.path(forResource: sound, ofType: type)
    {
        do{
            
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
            
        } catch{
            print("ERROR: LAGU TIDAK ADA!")
        }
    }
}

