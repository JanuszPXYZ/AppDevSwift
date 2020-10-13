//
//  ViewController.swift
//  Login2
//
//  Created by Janusz Polowczyk on 04/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var forgottenUserNameButton: UIButton!
    @IBOutlet var forgottenPasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "loginSegue", sender: sender)
    }
    @IBAction func forgottenUserPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "loginSegue", sender: sender)
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if !loginButton.isSelected {
            segue.destination.navigationItem.title = userNameTextField.text
        } else if !forgottenUserNameButton.isSelected {
            segue.destination.navigationItem.title = "Forgotten User Name"
        } else if !forgottenPasswordButton.isSelected {
            segue.destination.navigationItem.title = "Forgotten Password"
        }
    }

}

