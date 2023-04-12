//
//  SecondViewController.swift
//  UMC_thirdweekpractice
//
//  Created by 신예진 on 2023/04/12.
//

import Foundation
import UIKit

class SecondViewController :UIViewController{
    
    
    @IBOutlet weak var uiResult: UILabel!

    var result : String? = "UMC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiResult.text = result
    }
    
    
}
