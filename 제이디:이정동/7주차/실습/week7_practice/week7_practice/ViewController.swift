//
//  ViewController.swift
//  week7_practice
//
//  Created by 이정동 on 2023/05/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func signInButtonTapped(_ sender: UIButton) {
        guard let userInfo = UserDefaults.standard.object(forKey: idTextField.text!) as? [String: String] else {
            topLabel.text = "존재하지 않는 ID"
            return
        }
        
        guard pwTextField.text! == userInfo["pw"] else {
            topLabel.text = "비밀번호 불일치"
            return
        }

        topLabel.text = "로그인 성공"
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        
        // 이미 등록된 id인지 확인
        guard UserDefaults.standard.object(forKey: idTextField.text!) == nil else {
            topLabel.text = "이미 존재하는 ID"
            return
        }
        
        // 유저 id, pw 정보
        let userInfo: [String: String] = ["id" : idTextField.text!, "pw" : pwTextField.text!]
        
        // 등록
        UserDefaults.standard.set(userInfo, forKey: idTextField.text!)
        topLabel.text = "회원가입 성공"
    }
}

