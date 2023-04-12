//
//  BlackViewController.swift
//  UMC_thirdweekpractice
//
//  Created by 신예진 on 2023/04/11.
//


import UIKit

class BlackViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    var data : String = ""
    var PinkVC : UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataLabel.text = data
        
        
        guard let vc = self.PinkVC as? PinkViewController else{
            return
        }
        vc.checkResponse(str: "receive success")
    }
}
