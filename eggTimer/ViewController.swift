//
//  ViewController.swift
//  eggTimer
//
//  Created by Kağan Değirmen on 25.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var softButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 300,"Medium":420,"Hard":720]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    
    @objc func updateCounter() {
        if secondsPassed < totalTime {
            secondsPassed+=1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
        }else{
            timer.invalidate()
            titleLabel.text = "Done!"
            softButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        }
            
    }

    @IBAction func eggSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        titleLabel.text = hardness
        sender.setTitleColor(UIColor.systemYellow, for: UIControl.State.normal)
        secondsPassed = 0
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
}

