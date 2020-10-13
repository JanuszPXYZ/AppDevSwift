//
//  ViewController.swift
//  Calculator
//
//  Created by Janusz Polowczyk on 28/09/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var secondRowStack: [UIStackView]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"
    }
    
    @IBAction func clearCalc(_ sender: UIButton) {
        resultLabel.text = "0"
    }
    
    @IBAction func additionAction(_ sender: UIButton) {
        if !sender.isSelected {
            resultLabel.text = "Equals"
        }
    }
    
    

}

