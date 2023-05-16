//
//  ThirdViewController.swift
//  UMC_seventhweekpractice
//
//  Created by 신예진 on 2023/05/17.
//

import Foundation
import UIKit

extension String{
    static let passwordKey = "passwordKey"
    static let usernameKey = "usernameKey"
    static let signInKey =
    "hasSignedInKey"
}

var un = ""

class ThirdViewController:UIViewController{
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    var hasSignnedUp:Bool = false
    var chosenUsername:String = ""
    var chosenPassword:String = ""
    
    let standardUserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
        if #available(iOS 12.0, *) {
            password.textContentType = .oneTimeCode
        }
        
    }
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "segue"{
//            let FinishVC = segue.destination as! FinishViewController
//            let label = FinishVC.label
//            label?.text = "\(chosenUsername)"
//        }
//    }
    
    func getData() {
        guard let storedUsername = standardUserDefaults.value(forKey: .usernameKey) as? String else {return}
        guard let storedPassword = standardUserDefaults.value(forKey: .passwordKey) as? String else {return}
        let userHasSignedIn = standardUserDefaults.bool(forKey: .signInKey)
        
        chosenUsername = storedUsername
        chosenPassword = storedPassword
        hasSignnedUp = userHasSignedIn
        
        print(chosenUsername, storedPassword, hasSignnedUp)
        
    }
    
    
    @IBAction func signUpAction(_ sender: Any) {
        if hasSignnedUp == false {
            hasSignnedUp = true
            guard let usernameText = username.text,
                  let passwordText = password.text else {return}
            
            standardUserDefaults.set(usernameText, forKey: .usernameKey)
            standardUserDefaults.set(passwordText, forKey: .passwordKey)
            standardUserDefaults.set(hasSignnedUp, forKey: .signInKey)
            un = chosenUsername
            performSegue(withIdentifier: "segue", sender: self)
            
        } else{
            if username.text == chosenUsername && password.text == chosenPassword {
                un = chosenUsername
                performSegue(withIdentifier: "segue", sender: self)
                
            } else {
                print("틀렸습니다!")
            }
        }
        
        
    }
    
    
    
    
}
