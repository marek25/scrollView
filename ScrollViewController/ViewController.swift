//
//  ViewController.swift
//  ScrollViewController
//
//  Created by OSX on 1/21/19.
//  Copyright © 2019 AppDoctor. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UIScrollViewDelegate {

    var picturChangingTimer : Timer?
    var imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    func startTimers() {
        picturChangingTimer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true, block: { (timer) in
            if self.imageURL ==  URLs.fjodorsURL {
                self.pictureChanger2()
            } else if self.imageURL == URLs.secondImage {
                self.pictureChanger3()
            } else if self.imageURL == URLs.thirdImage {
                self.pictureChanger1()
            }
   
        })
        
    
    }
    
    func pictureChanger1() {
            self.imageURL = nil
            self.imageView.image = nil
            self.imageURL=URLs.fjodorsURL
    }
    
    func pictureChanger2() {
            self.imageURL = nil
            self.imageView.image = nil
            self.imageURL=URLs.secondImage
    }
    
    func pictureChanger3() {
            self.imageURL = nil
            self.imageView.image = nil
            self.imageURL=URLs.thirdImage
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
        imageURL = URLs.fjodorsURL
        startTimers()
    }
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            
            scrollView.maximumZoomScale = 5.0
            scrollView.minimumZoomScale = 1/25
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
   
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    var imageView  = UIImageView()
    
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                self.image = UIImage(data: imageData)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if imageURL == nil {
//            imageURL = URLs.fjodorsURL
//        }
    }

}

