//
//  SecondVC.swift
//  ThirdWeek_Practice
//
//  Created by 정호진 on 2023/04/11.
//

import Foundation
import UIKit

final class SecondVC: UIViewController{
    var testData: String?
    var delegate: SendData?
    var sendClosure: ((String) -> ())?
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.text = testData ?? ""
    }
    
    @IBAction func clickedBackBtn(_ sender: Any) {
        print("send SecondVC to ViewController\nData\(testLabel.text ?? "")")
//        delegate?.sendData(text: testLabel.text)
        sendClosure?(self.testLabel.text ?? "")
        self.navigationController?.popViewController(animated: true)
    }
}

protocol SendData{
    func sendData(text: String?)
}

