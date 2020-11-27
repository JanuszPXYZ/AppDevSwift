//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Janusz Polowczyk on 19/11/2020.
//  Copyright © 2020 Janusz Polowczyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var copyrightLabel: UILabel!
    let photoInfoController = PhotoInfoController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = ""
        copyrightLabel.text = ""
    
        
        photoInfoController.fetchPhotoInfo { (photoInfo) in
            if let photoInfo = photoInfo {
                self.updateUI(with: photoInfo)
            }
        }
    }
    
    func updateUI(with photoInfo: PhotoInfo) {
//        guard let url = photoInfo.url.withHTTPS() else { return }
        let task = URLSession.shared.dataTask(with: photoInfo.url) { (data, response, error) in

            guard let data = data,
                let spacePhoto = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.title = photoInfo.title
                self.photoImageView.image = spacePhoto
                self.descriptionLabel.text = photoInfo.description
                
                if let copyright = photoInfo.copyright {
                    self.copyrightLabel.text = "Copyright: \(copyright)"
                } else {
                    self.copyrightLabel.isHidden = true
                    }
                }
            }
        task.resume()
        }


    }
    

