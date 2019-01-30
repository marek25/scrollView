//
//  PicturesVC.swift
//  ScrollViewController
//
//  Created by OSX on 1/23/19.
//  Copyright © 2019 AppDoctor. All rights reserved.
//

import UIKit
import Foundation

class PicturesVC: UIViewController, UIScrollViewDelegate {
    
    var imageForImageView : UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
    }
    var imageView  = UIImageView()
    
    @IBOutlet weak var imageView2: UIImageView!
    
    
    
    @IBOutlet weak var scrollView: UIScrollView! {
        
        didSet {
            
            scrollView.maximumZoomScale = 6.0
            scrollView.minimumZoomScale = 1/1
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageView.image == nil {
            imageView.image = imageForImageView
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
        
       // imageView2.image = imageForImageView
    }
    
    
    @objc func doubleTapped() {
        func unwindToMenu(segue: UIStoryboardSegue) {}
        let alert = UIAlertController(title: "Do you want to go back?", message: "Tap Yes if you want, or No if you want to countinue.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "yes", style: .default, handler: { (UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        imageView.image = imageForImageView
        print("imageForImageView: \(imageForImageView)" )
        print("imageView: \(imageView)")
        
        if imageView.image != nil {
            print("imageView.image is there")
        }
      //  imageView2.image = imageForImageView
    }
 

}
