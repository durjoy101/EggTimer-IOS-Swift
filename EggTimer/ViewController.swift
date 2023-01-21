
//
//  ViewController.swift
//  EggTimer
//
//  Created by Samar Mitra on 15/11/22.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 5, "Medium": 8, "Hard": 12]
    
    var secondPassed = 0
    var totalTime = 0
    var parcentageProgress: Float = 0.0
    
    var timer = Timer()

    var player: AVAudioPlayer?
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!

        titleLabel.text = hardness
        progressBar.progress = 0.0
        secondPassed = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
       
    }
        
    @objc func updateTimer() {
        if secondPassed < totalTime {
            secondPassed += 1
            parcentageProgress = Float(secondPassed) / Float(totalTime)
            progressBar.progress = parcentageProgress
            
        }
        else{
            timer.invalidate()
            titleLabel.text = "Done"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player!.play()
        }
    }
    
        
}



