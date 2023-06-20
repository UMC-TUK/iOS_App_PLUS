//
//  ViewController.swift
//  week9_mission
//
//  Created by 이정동 on 2023/06/20.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
        LoginNetManager.shared.googleLogin(self) { status in
            if status {
                let vc = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
}

