//
//  SecondViewController.swift
//  week3_practice
//
//  Created by 이정동 on 2023/04/06.
//

import UIKit

class SecondViewController: UIViewController {
    
    var vc: FirstViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonTapped(_ sender: UIButton) {
        vc?.data = "hi"
        navigationController?.popViewController(animated: true)
    }
    

}
