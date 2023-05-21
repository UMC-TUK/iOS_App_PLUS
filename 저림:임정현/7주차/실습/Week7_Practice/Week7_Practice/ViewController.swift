//
//  ViewController.swift
//  Week7_Practice
//
//  Created by 우주대스타 on 2023-05-15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        guard let id = idTextField.text else { return}
        guard let password = pwdTextField.text else {return}
        
        if UserDefaults.standard.string(forKey: id) == nil {
            let alert = UIAlertController(title: "경고", message: "데이터가 없습니다 :(", preferredStyle: UIAlertController.Style.alert)
            let defaultAction = UIAlertAction(title: "OK", style: .destructive, handler : nil)
            alert.addAction(defaultAction)
            present(alert, animated: false, completion: nil)
            print("데이터가 없습니다.")
        }
        else if password != UserDefaults.standard.string(forKey: id) {
            print(" 비밀번호가 알맞지 않습니다.")
            let alert = UIAlertController(title: "경고", message: "비밀번호가 알맞지 않습니다 :(", preferredStyle: UIAlertController.Style.alert)
            let defaultAction = UIAlertAction(title: "OK", style: .destructive, handler : nil)
            alert.addAction(defaultAction)
            present(alert, animated: false, completion: nil)
        }
        else {
            guard let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {return}
            
            present(loginViewController, animated: true)
            print("로그인 성공!")
            
        }
    }
    

    @IBAction func signUpButton(_ sender: Any) {
        idTextField.text = ""
        pwdTextField.text = ""
        guard let signUpViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else {return}
        
        present(signUpViewController, animated: true)
    }
    
}

