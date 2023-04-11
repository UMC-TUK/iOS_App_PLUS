//
//  ViewController.swift
//  ThirdWeek_Practice
//
//  Created by 정호진 on 2023/04/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    
    @IBAction func clickedBtn(_ sender: Any) {
        guard let secondVC = storyboard?.instantiateViewController(identifier: "SecondVC") as? SecondVC else {return}
        print("send ViewController to SecondVC")
//        secondVC.delegate = self
        secondVC.testData = "abcdefg"
        secondVC.sendClosure = { text in
            self.dataLabel.text = text
        }
        self.navigationController?.pushViewController(secondVC, animated: true)

    }
}

extension ViewController: SendData{
    func sendData(text: String?) {
        print("get data \(text ?? "")")
        self.dataLabel.text = text
    }
}

