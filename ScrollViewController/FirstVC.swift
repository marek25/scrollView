//
//  FirstVC.swift
//  ScrollViewController
//
//  Created by OSX on 1/23/19.
//  Copyright © 2019 AppDoctor. All rights reserved.
//

import UIKit
import Foundation




class FirstVC: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       Images.fetchImages()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Picture1" {
            if let destinationVC1 = segue.destination as? PicturesVC {
                destinationVC1.imageForImageView = Images.firstImage
                print("prepared Picture1")
            }
        }
        if segue.identifier == "Picture2" {
            if let destinationVC2 = segue.destination as? PicturesVC {
                destinationVC2.imageForImageView = Images.secondImage
                print("prepared Picture2")
            }
        }
        if segue.identifier == "Picture3" {
            if let destinationVC3 = segue.destination as? PicturesVC {
                destinationVC3.imageForImageView = Images.secondImage
                print("prepared Picture3")
            }
        }
    }

    
    
    @IBAction func selfTimer(_ sender: UIButton) {
        performSegue(withIdentifier: "selfTimer", sender: UIButton.self)
        
    }
    
    @IBAction func Picture1(_ sender: UIButton) {
        performSegue(withIdentifier: "Picture1", sender: UIButton.self)
        print("performed Picture1")
    }
    
    
    @IBAction func Picture2(_ sender: UIButton) {
        performSegue(withIdentifier: "Picture2", sender: UIButton.self)
        print("performed Picture2")
    }
    
    @IBAction func Picture3(_ sender: UIButton) {
        performSegue(withIdentifier: "Picture3", sender: UIButton.self)
        print("performed Picture3")
    }
    
    
    

}
