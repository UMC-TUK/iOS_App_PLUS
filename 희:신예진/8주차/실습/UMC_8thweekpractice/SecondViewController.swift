//
//  SecondViewController.swift
//  UMC_8thweekpractice
//
//  Created by 신예진 on 2023/05/25.
//

import Foundation
import UIKit


class SecondViewController:UIViewController{
    
    @IBOutlet weak var clickbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func click(_ sender: Any) {
        let bottomSheetVC =
        BottomSheetViewController(contentViewController: UIViewController())
        bottomSheetVC.modalPresentationStyle = .overFullScreen
        self.present(bottomSheetVC, animated: false, completion: nil)
    }
    
}
