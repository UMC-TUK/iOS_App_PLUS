//
//  MainViewController.swift
//  UMC_thirdweekpractice
//
//  Created by 신예진 on 2023/04/12.
//

import Foundation
import UIKit

class MainViewController: UIViewController{
    
    @IBOutlet weak var UITextField: UITextField!
    
    @IBAction func didTapAction(_ sender: Any) {
        let data : String = UITextField.text!
        
        let SecondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as!SecondViewController
        
        SecondViewController.result = data
        
        self.present(SecondViewController, animated:true, completion: nil)
    }
    
    
}
