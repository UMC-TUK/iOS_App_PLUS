//
//  ViewController.swift
//  SeventhWeek-Mission
//
//  Created by 정호진 on 2023/05/16.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var newPeople: UIButton!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var iDTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        for key in UserDefaults.standard.dictionaryRepresentation().keys {
//           UserDefaults.standard.removeObject(forKey: key.description)
//        }
    }

    @IBAction func clickedLogin(_ sender: Any) {
        guard let id = iDTextField.text else {return}
        guard let password = password.text else {return}
        
        if id != "" && password != ""{
            let inputpassword = UserDefaults.standard.string(forKey: id)

            if inputpassword == password{
                let alert = UIAlertController(title: "👍", message: nil, preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default)
                
                alert.addAction(ok)
                self.present(alert,animated: true)
            }
            else{
                alertActionCode()
            }
        }
        else{
            alertActionCode()
        }
    }
    

    @IBAction func clickedNewPeople(_ sender: Any) {
        self.iDTextField.text = ""
        self.password.text = ""
        let nextVC = CreateIDController()
        self.present(nextVC, animated: true)
    }
    
    private func alertActionCode(){
        let alert = UIAlertController(title: "잘못된 입력입니다.", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(ok)
        self.present(alert,animated: true)
    }
}

