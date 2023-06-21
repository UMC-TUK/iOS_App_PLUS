//
//  ViewController.swift
//  LoginSample
//
//  Created by 우주대스타 on 2023-06-20.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class ViewController: UIViewController {
    
    @IBOutlet weak var stateLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func googleLoginBtn(_ sender: GIDSignInButton) {
        
        guard let clienID = FirebaseApp.app()?.options.clientID else {return}
        let config = GIDConfiguration(clientID: clienID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
            guard error == nil else {
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                }
                else {
                    print("Login Successful")
                    self.stateLabel.text = "구글 로그인 성공  🔓"
                }
              // At this point, our user is signed in
            }
                
        }
    }
    
}

