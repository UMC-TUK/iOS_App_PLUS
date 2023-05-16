//
//  SecondViewController.swift
//  UMC_seventhweekpractice
//
//  Created by 신예진 on 2023/05/17.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(), style: .plain, target: self, action: nil)
    }
    
    @IBAction func onClickLogout(_ sender: Any){
        UserDefaults.standard.removeObject(forKey: "email")
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController")
        let navVC = UINavigationController(rootViewController: vc!)
        let share = UIApplication.shared.delegate as? SceneDelegate
        share?.window?.rootViewController = navVC
        share?.window?.makeKeyAndVisible()
        
        
    }
    
    
    
}
