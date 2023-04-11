//
//  SecondVC.swift
//  ThirdWeek_Practice-2
//
//  Created by 정호진 on 2023/04/11.
//

import Foundation
import UIKit

final class SecondVC: UIViewController{
    var testData: String?
    @IBOutlet weak var testLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        testLabel.text = testData ?? ""
    }
}
