//
//  ViewController.swift
//  Light
//
//  Created by Janusz Polowczyk on 23/09/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lightsButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func lightsOn(_ sender: Any) {
        if lightsButton.isOn {
            view.backgroundColor = .white
        } else {
            view.backgroundColor = .black
        }
    }
    
}

