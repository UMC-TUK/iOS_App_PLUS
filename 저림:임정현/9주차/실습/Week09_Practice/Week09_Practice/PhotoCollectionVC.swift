//
//  PhotoCollectionVC.swift
//  Week09_Practice
//
//  Created by 우주대스타 on 2023-05-31.
//

import Foundation
import UIKit

class PhotoCollectionVC : UIViewController {
    
    var vcTitle : String = "" {
        didSet {
            print("PhotoCollectionVC - vcTitle didSet() called / vcTitle : \(vcTitle)")
            self.title = vcTitle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("PhotoCollectionVC - viewDidLoad() 호출")
    }
}
