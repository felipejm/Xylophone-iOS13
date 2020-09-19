//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyDown(_ sender: UIButton) {
        sender.alpha = 0.5
    }
    
    @IBAction func keypressed(_ sender: UIButton) {
        print("Start")
        playSound(title: sender.currentTitle)
        
        let time = DispatchTime.now() + .milliseconds(200)
        DispatchQueue.main.asyncAfter(deadline: time) {
            sender.alpha = 1
            print("End")
        }
    }
    
    func playSound(title: String?){
        let url = Bundle.main.url(forResource: title, withExtension: ".wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

