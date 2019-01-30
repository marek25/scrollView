//
//  Logic.swift
//  ScrollViewController
//
//  Created by OSX on 1/21/19.
//  Copyright © 2019 AppDoctor. All rights reserved.
//

import Foundation
import UIKit

struct URLs {
    static let fjodorsURL = URL.init(string: "https://www.w3schools.com/w3images/fjords.jpg")
    static let secondImage = URL.init(string: "https://tinypng.com/images/social/website.jpg")
    static let thirdImage = URL.init(string: "https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")
}

struct Images {
    static var firstImage : UIImage?
    static var secondImage : UIImage?
    static var thirdImage : UIImage?
    
   
    static func fetchImages() {

            if let url1 = URLs.fjodorsURL, let url2 = URLs.secondImage, let url3 = URLs.thirdImage {
                let urlContents1 = try? Data(contentsOf: url1)
                let urlContests2 = try? Data(contentsOf: url2)
                let urlContests3 = try? Data(contentsOf: url3)
                if let imageData1 = urlContents1, let imageData2 = urlContests2, let imageData3 = urlContests3 {
                    self.firstImage = UIImage(data: imageData1)
                    print("firstImage \(firstImage)")
                    self.secondImage = UIImage(data: imageData2)
                    print("secondImage \(secondImage)")
                    self.thirdImage = UIImage(data: imageData3)
                    print("thirdImage \(thirdImage)")
                    
                }
            }
//            if let url2 = URLs.secondImage {
//                let urlContents2 = try? Data(contentsOf: url2)
//                if let imageData2 = urlContents2 {
//                    self.secondImage = UIImage(data: imageData2)
//                }
//            }
//        if let url2 = URLs.thirdImage {
//            let urlContents3 = try? Data(contentsOf: url2)
//            if let imageData3 = urlContents3 {
//                self.thirdImage = UIImage(data: imageData3)
//            }
//        }
    }
}
