//
//  ViewController.swift
//  Week07_2
//
//  Created by 우주대스타 on 2023-05-22.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    var subscriptions = Set<AnyCancellable>()

    @IBOutlet weak var loginLabel: UILabel!
    
    lazy var kakaoAuthVM: KakaoAuthVM = { KakaoAuthVM() }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func loginBtnClicked(_ sender: Any) {
        print("loginBtnclicked() called")
        kakaoAuthVM.KakaoLogin()
        loginLabel.text = "로그인상태"
//        if kakaoAuthVM.isLoggedIn == true {
//            loginLabel.text = "로그인 상태"
//        }
    }
    
    
    @IBAction func logoutBtnClicked(_ sender: Any) {
        print("logoutBtnClicked() called")
        kakaoAuthVM.kakaoLogout()
//        if !kakaoAuthVM.isLoggedIn {
//            loginLabel.text = "로그아웃 상태"
//        }
        loginLabel.text = "로그아웃 상태"
    }
}

extension ViewController {
    fileprivate func setBindings() {
        self.kakaoAuthVM.loginStatusInfo.receive(on:  DispatchQueue.main).assign(to: \.text, on: self.loginLabel).store(in: &subscriptions)
    }
}
