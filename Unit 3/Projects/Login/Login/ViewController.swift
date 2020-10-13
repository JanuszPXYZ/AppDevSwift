//
//  ViewController.swift
//  Login
//
//  Created by Janusz Polowczyk on 04/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var additionalButton: UIButton!
    @IBOutlet var forgotUserNameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if !additionalButton.isSelected && segue.identifier == "loginSegue" {
            segue.destination.navigationItem.title = userNameTextField.text
        } else if !forgotUserNameButton.isSelected && segue.identifier == "forgottenUserSegue"{
            segue.destination.navigationItem.title = "Forgotten User Name"
        } else if !forgotPasswordButton.isSelected && segue.identifier == "forgottenPassword" {
            segue.destination.navigationItem.title = "Forgotten Password"
            
        }
    }

}

