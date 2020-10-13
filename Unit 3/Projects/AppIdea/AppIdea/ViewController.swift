//
//  ViewController.swift
//  AppIdea
//
//  Created by Janusz Polowczyk on 04/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var secondTimerLabel: UILabel!
    @IBOutlet var pauseButton: UIButton!
    @IBOutlet var startButton: UIButton!
    
    
    var seconds = 60
    var anotherCounter = 20
    var isFirstTimerRunning = false
    var isSecondTimerRunning = false
    var resumeTapped = false
    var timer = Timer()
    var timerTwo = Timer()


    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = "\(seconds)"
        secondTimerLabel.text = "\(anotherCounter)"
    }
    
    func runFirstTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decreaseFirstTimer), userInfo: nil, repeats: true)
        isFirstTimerRunning = true
        startButton.isEnabled = false
    }
    
    func runSecondTimer() {
        timerTwo = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decreaseSecondTimer), userInfo: nil, repeats: true)
    }
    
    @objc func decreaseFirstTimer() {
        seconds -= 1
        timerLabel.text = "\(seconds)"
//        timeString(time: TimeInterval(seconds))
    }
    @objc func decreaseSecondTimer() {
        if seconds <= 55 {
            anotherCounter -= 1
            secondTimerLabel.text = "\(anotherCounter)"
            isSecondTimerRunning = true
        }
    }

    @IBAction func startButtonPressed(_ sender: Any) {
        runFirstTimer()
        runSecondTimer()
    }
    
    @IBAction func pauseButtonPressed(_ sender: UIButton) {
        if self.resumeTapped == false {
            sender.setTitle("Resume", for: .normal)
            timer.invalidate()
            timerTwo.invalidate()
            self.resumeTapped = true
        } else {
            runFirstTimer()
            runSecondTimer()
            sender.setTitle("Pause", for: .normal)
            self.resumeTapped = false
        }
    }
    
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        if !sender.isSelected {
            seconds = 60
            anotherCounter = 20
            timer.invalidate()
            timerTwo.invalidate()
            timerLabel.text = "\(seconds)"
            secondTimerLabel.text = "\(anotherCounter)"
            startButton.isEnabled = true
        }
    }
    
//    
}
