//
//  BlueViewController.swift
//  Week03_Practice
//
//  Created by 우주대스타 on 2023-04-11.
//

import Foundation

import UIKit

class BlueViewController: UIViewController {
 
    @IBOutlet weak var dataLabel: UILabel!
    var data : String = "waiting"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataLabel.text = data
    }
}
