//
//  FinishViewController.swift
//  UMC_seventhweekpractice
//
//  Created by 신예진 on 2023/05/17.
//

import Foundation
import UIKit

class FinishViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        label.text = "\(un)"
    }
    
}
