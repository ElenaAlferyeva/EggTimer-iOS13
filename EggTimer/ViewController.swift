//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTime = ["Soft":3, "Medium":4, "Hard":5]
    var counter = 30
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    @IBAction func hardnessSelected(_ sender: UIButton) {
        

        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        
let hardness = sender.currentTitle!
 totalTime = eggTime[hardness]!

            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)




}

    @IBOutlet weak var titleLabel: UILabel!
    @objc func updateTime() {
        //example functionality
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            print(progressBar.progress)
        } else {
            timer.invalidate()
            titleLabel.text = "Done"
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
