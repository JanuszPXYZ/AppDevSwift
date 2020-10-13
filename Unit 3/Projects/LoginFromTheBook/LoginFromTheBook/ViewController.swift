//
//  ViewController.swift
//  LoginFromTheBook
//
//  Created by Janusz Polowczyk on 04/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var forgottenUserNameButton: UIButton!
    @IBOutlet var forgottenPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {return}
        
        if sender == forgottenPasswordButton {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == forgottenUserNameButton {
            segue.destination.navigationItem.title = "Forgot Username"
        } else {
            segue.destination.navigationItem.title = userNameTextField.text
        }
    }
    
    @IBAction func forgotButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "VCSegue", sender: forgottenUserNameButton)
    }
    
    @IBAction func forgotPasswordPressed(_ sender: Any) {
        performSegue(withIdentifier: "VCSegue", sender: forgottenPasswordButton)
    }
    
    @IBAction func loginPressed(_ sender: Any) {
    }
    

}

