//
//  ViewController.swift
//  ISpy
//
//  Created by Janusz Polowczyk on 14/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet var mainScrollView: UIScrollView!
    @IBOutlet var mainImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScrollView.delegate = self
        updateZoomFor(size: view.bounds.size)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return mainImageView
    }
    func updateZoomFor(size: CGSize) {
        let widthScale = size.width / mainImageView.bounds.width
        let heightScale = size.height / mainImageView.bounds.height
        let scale = min(widthScale, heightScale)
        mainScrollView.minimumZoomScale = scale
        mainScrollView.zoomScale = scale
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    

}

