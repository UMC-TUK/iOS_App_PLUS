//
//  ViewController.swift
//  EighthWeeks-Practice
//
//  Created by 정호진 on 2023/05/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var searchbtn: UIButton!
    @IBOutlet weak var searchBtnTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchbtn.layer.cornerRadius = 10
    }

    @IBAction func clickbtn(_ sender: Any) { }
}

