//
//  OrderConfirmationViewController.swift
//  Restaurant
//
//  Created by Janusz Polowczyk on 29/11/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    
    
    @IBOutlet var timeRemainingLabel: UILabel!
    var minutes: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        timeRemainingLabel.text = "Thank you for your order! Your wait time is approximately \(minutes!) minutes."
    }
}
