//
//  ViewController.swift
//  Contest
//
//  Created by Janusz Polowczyk on 12/11/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func submitEmailButton(_ sender: UIButton) {
        if let text = emailTextField.text, !text.isEmpty {
            performSegue(withIdentifier: "contestSubmission", sender: nil)
        } else {
            shakeAnimation()
        }
    }
    
    func shakeAnimation() {
        UIView.animate(withDuration: 0.1, animations: {
            let transformVariableRight = CGAffineTransform(translationX: 15, y: 0)
            self.emailTextField.transform = transformVariableRight
        }) { (_) in
            UIView.animate(withDuration: 0.1, animations: {
            let transformVariableLeft = CGAffineTransform(translationX: -30, y: 0)
            self.emailTextField.transform = transformVariableLeft
                
            }, completion: {(_) in
                self.emailTextField.transform = CGAffineTransform.identity
            })
    }
}

}
