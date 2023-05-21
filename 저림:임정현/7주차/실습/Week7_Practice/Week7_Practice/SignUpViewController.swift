//
//  SignUpViewController.swift
//  Week7_Practice
//
//  Created by 우주대스타 on 2023-05-15.
//

import UIKit


class SignUpViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButtonDidTap(_ sender: Any) {
        guard let id = idTextField.text else {return}
        guard let password = pwdTextField.text else {return}
        
        UserDefaults.standard.set(password, forKey: id)
        
        print("이름 : \(id) , 비밀번호: \(password)")
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
