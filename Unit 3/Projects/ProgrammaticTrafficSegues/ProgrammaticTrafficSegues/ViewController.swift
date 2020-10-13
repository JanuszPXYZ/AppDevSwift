//
//  ViewController.swift
//  ProgrammaticTrafficSegues
//
//  Created by Janusz Polowczyk on 04/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var segueSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func yellowButtonTapped(_ sender: UIButton) {
        guard segueSwitch.isOn else { return }
        performSegue(withIdentifier: "Yellow", sender: sender)
    }
    
    @IBAction func greenButtonTapped(_ sender: UIButton) {
        guard segueSwitch.isOn else { return }
        performSegue(withIdentifier: "Green", sender: sender)
    }
}

