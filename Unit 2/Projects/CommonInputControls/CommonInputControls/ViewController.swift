//
//  ViewController.swift
//  CommonInputControls
//
//  Created by Janusz Polowczyk on 24/09/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var buttonToPress: UIButton!
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var toggle: UISwitch!
    @IBOutlet var slider: UISlider!
    
    
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonToPress.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }

    @objc func buttonTapped(_ sender: UIButton) {
        if buttonToPress.isSelected {
            print("Button was not selected")
        } else {
            count += 1
            print("Button was tapped \(count) times")
        }
        
        if toggle.isOn {
            print("The switch is on!")
        } else {
            print("The switch is off.")
        }
        
        print("The slider is set to \(slider.value)")
    }
    
    @IBAction func switchOn(_ sender: UISwitch) {
        if sender.isOn {
            print("The switch is on!")
        } else {
            print("The switch is off.")
        }
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        print(sender.value)
    }
    
    @IBAction func keyboardReturnKeyTapped(_ sender: UITextField) {
        if let text = sender.text {
            userLabel.text = text
        }
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location)
    }
    
}

