//
//  ViewController.swift
//  HorizontalScrollImgs
//
//  Created by Janusz Polowczyk on 13/10/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainScrollView: UIScrollView!
    var favoriteImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoriteImages = [UIImage(named: "TrashPanda")!, UIImage(named: "tmksxyqkd1k11")!, UIImage(named: "tqkG8th")!]
        
        for image in 0..<favoriteImages.count {
            let imageView = UIImageView()
            imageView.image = favoriteImages[image]
            imageView.contentMode = .scaleToFill
            let xPosition = self.view.frame.width * CGFloat(image)
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            
            mainScrollView.contentSize.width = mainScrollView.frame.width * CGFloat(image + 1)
            mainScrollView.addSubview(imageView)
        }
    }


}

