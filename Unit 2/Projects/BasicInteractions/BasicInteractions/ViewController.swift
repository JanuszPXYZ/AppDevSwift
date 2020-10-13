//
//  ViewController.swift
//  BasicInteractions
//
//  Created by Janusz Polowczyk on 24/09/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

// The objective of this lab is to create and compile an app with two buttons that, when tapped, change the contents of a label

import UIKit

class ViewController: UIViewController {
    @IBOutlet var labelToSet: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var setButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelToSet.text = "Set the label"
    }


    @IBAction func setText(_ sender: UITextField) {
        if let text = sender.text {
            labelToSet.text = text
        }
    }
    @IBAction func clearButton(_ sender: UIButton) {
        if !sender.isSelected {
            labelToSet.text = "Set the label"
            textField.text = ""
        }
    }
    
    @IBAction func testingButton(_ sender: UIButton) {
        if !sender.isSelected {
            setText(textField)
        }
    }
    
}

