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
        setBindings()
        if kakaoAuthVM.isLoggedIn == true {
            nextPage()
        }
        // Do any additional setup after loading the view.
    }


    @IBAction func loginBtnClicked(_ sender: Any) {
        print("loginBtnclicked() called")
        kakaoAuthVM.KakaoLogin()
        print("kakaoAuthVM >> ")
        print(kakaoAuthVM.isLoggedIn)
        if kakaoAuthVM.isLoggedIn == true {
//            self.loginLabel.text = "check"
            print("check")
//            nextPage()
        }
        print("outside")
//        nextPage()
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
    func nextPage(){
            guard let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {return}
    
                present(loginViewController, animated: true)
        }
}
