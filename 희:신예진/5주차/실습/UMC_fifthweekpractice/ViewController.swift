//
//  ViewController.swift
//  UMC_fifthweekpractice
//
//  Created by 신예진 on 2023/05/03.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var button: UIButton!
    
    @objc func buttonAction(_ sender : Any){
        print(#function)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let actionSelector = #selector(buttonAction(_:))
        button.addTarget(self, action: actionSelector, for: .touchUpInside)
    }
    
    


}

