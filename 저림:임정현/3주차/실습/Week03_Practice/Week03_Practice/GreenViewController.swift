//
//  GreenViewController.swift
//  Week03_Practice
//
//  Created by 우주대스타 on 2023-04-11.
//

import Foundation

import UIKit


class GreenViewController: UIViewController{
    
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
           super.viewDidLoad()
       }
    
    @IBAction func sendData(_ sender: Any) {
           guard let vc = self.storyboard?.instantiateViewController(identifier: "BlueViewController") as? BlueViewController else {
               return
           }
           
           vc.data = "hello blue"
           self.navigationController?.pushViewController(vc, animated: true)
       }
}
