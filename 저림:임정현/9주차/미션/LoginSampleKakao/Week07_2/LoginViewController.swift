//
//  LoginViewController.swift
//  Week07_2
//
//  Created by 우주대스타 on 2023-05-23.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var kakaoAuthVM: KakaoAuthVM = { KakaoAuthVM() }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressLogout(_ sender: Any) {
        print("logoutBtnClicked() called")
        kakaoAuthVM.kakaoLogout()
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
