//
//  ViewController.swift
//  AppEventCount
//
//  Created by Janusz Polowczyk on 11/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var didFinishLaunchingLabel: UILabel!
    @IBOutlet var willResignActiveLabel: UILabel!
    @IBOutlet var didEnterBackgroundLabel: UILabel!
    @IBOutlet var willEnterForegroundLabel: UILabel!
    @IBOutlet var didBecomeActiveLabel: UILabel!
    @IBOutlet var willTerminateLabel: UILabel!
    
    var launchCount = 0
    var willResignCount = 0
    var enterBackgroundCount = 0
    var enterForegroundCount = 0
    var becomeActiveCount = 0
    var willTerminateCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    func updateView() {
        didFinishLaunchingLabel.text = "The app has launched \(launchCount) time(s)"
        willResignActiveLabel.text = "The app has resigned \(willResignCount) time(s)"
        didEnterBackgroundLabel.text = "The app has entered background \(enterBackgroundCount) time(s)"
        willEnterForegroundLabel.text = "The app has entered foreground \(enterForegroundCount) time(s)"
        didBecomeActiveLabel.text = "The app did become active \(becomeActiveCount) time(s)"
        willTerminateLabel.text = "The app has terminated \(willTerminateCount) time(s)"
    }

}

