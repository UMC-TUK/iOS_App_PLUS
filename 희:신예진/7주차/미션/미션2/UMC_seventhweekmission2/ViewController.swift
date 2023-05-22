//
//  ViewController.swift
//  UMC_seventhweekmission2
//
//  Created by 신예진 on 2023/05/21.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser
import Alamofire
import AuthenticationServices

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 네비게이션 바 숨김 처리
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func kakaoLoginButton(_ sender: UIButton) {
           UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                   if let error = error {
                       print(error)
                   }
                   else {
                       print("loginWithKakaoAccount() success.")

                       // 로그인 성공 후 원하는 동작 수행
                       self.performSegue(withIdentifier: "NextScreenSegue", sender: nil)
                   }
               }
       }
}


