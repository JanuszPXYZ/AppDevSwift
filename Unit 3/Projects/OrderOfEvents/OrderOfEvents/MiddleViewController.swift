//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by Janusz Polowczyk on 06/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class MiddleViewController: UIViewController {
    @IBOutlet var lifeCycleLabel: UILabel!
    var eventNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let existingText = lifeCycleLabel.text {
            lifeCycleLabel.text = "\(existingText)\nEvent number \(eventNumber) was viewDidLoad"
            eventNumber += 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let existingText = lifeCycleLabel.text {
            lifeCycleLabel.text = "\(existingText)\nEvent number \(eventNumber) was viewWillAppear"
            eventNumber += 1
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        if let existingText = lifeCycleLabel.text {
            lifeCycleLabel.text = "\(existingText)\nEvent number \(eventNumber) was viewDidAppear"
            eventNumber += 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let existingText = lifeCycleLabel.text {
            lifeCycleLabel.text = "\(existingText)\nEvent number \(eventNumber) was viewWillDisappear"
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if let existingText = lifeCycleLabel.text {
            lifeCycleLabel.text = "\(existingText)\nEvent number \(eventNumber) was viewDidDisappear"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
