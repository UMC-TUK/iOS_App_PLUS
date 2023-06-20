//
//  ViewController.swift
//  LoginSampleNaver
//
//  Created by 우주대스타 on 2023-06-20.
//

import UIKit
import NaverThirdPartyLogin
import Alamofire

class ViewController: UIViewController, NaverThirdPartyLoginConnectionDelegate {
    
    @IBOutlet weak var stateLabel: UILabel!
    
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    override func viewDidLoad() {
        loginInstance?.delegate = self
//        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("Success login")
        stateLabel.text = "네이버 로그인 🔓"
//        getInfo()
    }
    
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        loginInstance?.accessToken
    }
    
    func oauth20ConnectionDidFinishDeleteToken() {
        print("log out")
    }
    
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("error = \(error.localizedDescription)")
    }
//    
//    func oauth20ConnectionDidOpenInAppBrowser(forOAuth request: URLRequest!) {
//            presentWebviewcontrollerWithRequest(request: request)
//    }
//
//    func presentWebviewcontrollerWithRequest(request: URLRequest) {
//            let controller: NLoginThirdPartyOAuth20InAppBrowserViewController = NLoginThirdPartyOAuth20InAppBrowserViewController(request: request)
//            controller.parentOrientation = UIInterfaceOrientation(rawValue: UIDevice.current.orientation.rawValue)!
//            present(controller, animated: true, completion: nil)
//    }
//
    @IBAction func naverLoginBtn(_ sender: Any) {
        loginInstance?.requestThirdPartyLogin()
    }
//
//        @IBAction func logout(_ sender: Any) {
//            loginInstance?.requestDeleteToken()
//        }
//        
        // RESTful API, id가져오기
//    func getInfo() {
//        guard let isValidAccessToken = loginInstance?.isValidAccessTokenExpireTimeNow() else { return }
//
//        if !isValidAccessToken {
//            return
//        }
//
//        guard let tokenType = loginInstance?.tokenType else { return }
//        guard let accessToken = loginInstance?.accessToken else { return }
//
//        let urlStr = "https://openapi.naver.com/v1/nid/me"
//        let url = URL(string: urlStr)!
//
//        let authorization = "\(tokenType) \(accessToken)"
//
//        let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
//
//        req.responseJSON { response in
//            guard let result = response.value as? [String: Any] else { return }
//            guard let object = result["response"] as? [String: Any] else { return }
//            guard let name = object["name"] as? String else { return }
//            guard let email = object["email"] as? String else { return }
//            guard let id = object["id"] as? String else {return}
//
//            print(email)
//
//            self.nameLabel.text = "\(name)"
//            self.emailLabel.text = "\(email)"
//            self.id.text = "\(id)"
//        }
//    }

}

