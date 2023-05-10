//
//  SecondViewController.swift
//  week3
//
//  Created by gildong hong on 2023/05/01.
//

import UIKit

class SecondViewController: UIViewController {
    
    var resultString = ""
    
    @IBOutlet var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = resultString

        // Do any additional setup after loading the view.
    }
}
