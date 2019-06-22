//
//  ViewController.swift
//  AudioPlayer+Background Play
//
//  Created by Rahul Chopra on 16/01/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Ik Vaari Aa", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            
            let audioSession = AVAudioSession.sharedInstance()
            
            do
            {
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            }
            catch
            {
                print(error)
            }
        }
        catch {
            print(error)
        }
    }

    @IBAction func btnPlay(_ sender: Any)
    {
        audioPlayer.play()
    }
    
    @IBAction func btnPause(_ sender: Any)
    {
        if audioPlayer.isPlaying
        {
            audioPlayer.pause()
        }
    }
    
    @IBAction func btnRestart(_ sender: Any)
    {
        if audioPlayer.isPlaying
        {
            audioPlayer.currentTime = 0
            audioPlayer.play()
        }
        else
        {
            audioPlayer.play()
        }
    }
    
}

