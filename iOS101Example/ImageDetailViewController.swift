//
//  ImageDetailViewController.swift
//  UIElementExample
//
//  Created by PiHan Hsu on 8/5/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var scrollView: UIScrollView!
    var imageView: UIImageView?
    var imageName: String?
    
    @IBOutlet var pictureImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = UIImage(named: imageName!) {
            pictureImageView.image = image
        }
        
        
        //imageView = UIImageView(image: image)
        
        scrollView.delegate = self
        
        //scrollView.addSubview(imageView!)
        scrollView.contentSize = pictureImageView!.frame.size
    }

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.pictureImageView
    }
    
}
