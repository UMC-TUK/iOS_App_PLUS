//
//  DelViewController.swift
//  Week04_Practice
//
//  Created by 우주대스타 on 2023-05-03.
//

import UIKit

class DelViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getText(_ sender: Any) {
        textLabel.text = textField.text
    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textLabel.text = textField.text
//        
//        return true
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
