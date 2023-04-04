//
//  ViewController.swift
//  week2_practice
//
//  Created by 이정동 on 2023/04/04.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var leftButton: UIButton!
    
    @IBOutlet weak var rightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        leftButton.layer.cornerRadius = leftButton.frame.width / 2
        rightButton.layer.cornerRadius = rightButton.frame.width / 2
    }


}

