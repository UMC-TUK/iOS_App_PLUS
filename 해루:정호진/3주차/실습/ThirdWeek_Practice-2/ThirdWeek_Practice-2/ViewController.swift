//
//  ViewController.swift
//  ThirdWeek_Practice-2
//
//  Created by 정호진 on 2023/04/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func clickedBtn(_ sender: Any) {
        performSegue(withIdentifier: "gotoSecond", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoSecond" {
            let vc = segue.destination as! SecondVC
            vc.testData = "abcdefg"
        }
    }
    
}

