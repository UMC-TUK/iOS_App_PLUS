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
import Pastel


class ViewController: UIViewController {
    
    var imageView: UIImageView = {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageView.image = UIImage(named: "tmb")
        return imageView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(imageView)
        
//        DispatchQueue.main.asyncAfter(deadline: .now()+13){
//            self.performSegue(withIdentifier: "NextScreenSegue", sender: self)
//        }
        // 네비게이션 바 숨김 처리
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+3 ){
            self.animation()
            
        }
    }
    
    func animation(){
        UIView.animate(withDuration:1){
            let size = self.view.frame.size.width * 2
            let xposition = size - self.view.frame.width
            let yposition = self.view.frame.height - size
            
            self.imageView.frame = CGRect(x: -(xposition/2), y: yposition/2, width: size, height: size)
            self.imageView.alpha = 0
            
            
        }
        
        
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


