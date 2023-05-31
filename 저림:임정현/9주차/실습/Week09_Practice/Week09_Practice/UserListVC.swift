//
//  UserListVC.swift
//  Week09_Practice
//
//  Created by 우주대스타 on 2023-05-31.
//

import Foundation
import UIKit

class UserListVC : UIViewController {
    
    var vcTitle : String = "" {
        didSet {
            print("UserListVC - vcTitle didSet() called / vcTitle : \(vcTitle)")
            self.title = vcTitle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("UserListVC - viewDidLoad() 호출")
    }
}
