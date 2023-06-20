//
//  LoginNetManager.swift
//  week9_mission
//
//  Created by 이정동 on 2023/06/21.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class LoginNetManager {
    static let shared = LoginNetManager()
    private init () {}
    
    func googleLogin(_ vc: UIViewController, completion: @escaping (Bool)->()) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: vc) { result, error in
            guard error == nil else { return }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { authResult, err in
                
                UserDefaults.standard.set(authResult?.user.refreshToken, forKey: "refreshToken")
                completion(true)
            }
            
        }
        completion(false)
    }
}
