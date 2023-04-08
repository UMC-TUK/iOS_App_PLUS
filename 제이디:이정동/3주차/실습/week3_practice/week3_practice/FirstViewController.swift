//
//  ViewController.swift
//  week3_practice
//
//  Created by 이정동 on 2023/04/06.
//

import UIKit

class FirstViewController: UIViewController {
    
    var data: String = "hello"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        print(data)
//    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "SecondVC") as! SecondViewController
        vc.vc = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

