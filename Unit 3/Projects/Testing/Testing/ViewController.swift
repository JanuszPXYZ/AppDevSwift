//
//  ViewController.swift
//  Testing
//
//  Created by Janusz Polowczyk on 04/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var rightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if !leftButton.isSelected && segue.identifier == "LeftTitle"{
            segue.destination.navigationItem.title = "Left"
        } else if !rightButton.isSelected && segue.identifier == "RightTitle" {
            segue.destination.navigationItem.title = "Right"
        }
    }
    
}

