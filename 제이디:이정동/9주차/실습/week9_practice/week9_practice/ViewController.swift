//
//  ViewController.swift
//  week9_practice
//
//  Created by 이정동 on 2023/05/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
        
        guard let searchTerm = searchTextField.text else { return }
        NetworkManager.shared.requestMusicData(searchTerm)
    }
    
}

