//
//  ViewController.swift
//  UMC_seventhweekpractice
//
//  Created by 신예진 on 2023/05/16.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var usertext: UITextField!
    
    
    @IBOutlet weak var pwdtext: UITextField!
    
    let email = "yejin0621@tukorea.ac.kr"
    let password = "4thUMCisthebest"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
     
    @IBAction func loginbtn(_ sender: Any) {
        if email == usertext.text! && password == pwdtext.text!{
            UserDefaults.standard.set(usertext.text!, forKey: "email")
            let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC")
            navigationController?.pushViewController(vc!, animated: true)
            
        } else {
            let alert = UIAlertController(title: "Alert", message: "Email or Password is not matching", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    

}

