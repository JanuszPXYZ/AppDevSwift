//
//  ViewController.swift
//  ProgrammaticViews
//
//  Created by Janusz Polowczyk on 26/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Foo"
        label.textAlignment = .center
        
        let view = UIView()
        view.addSubview(label)
        
        let margin: CGFloat = 30.0
    
        
        
    }


}

