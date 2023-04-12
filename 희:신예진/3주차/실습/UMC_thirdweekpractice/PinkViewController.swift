//
//  PinkViewController.swift
//  UMC_thirdweekpractice
//
//  Created by 신예진 on 2023/04/11.
//

import UIKit

class PinkViewController: UIViewController{

    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendData(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "BlackVC") as? BlackViewController else {
            return
    }
        vc.data = "UMC 화이팅"
        vc.PinkVC = self
        self.navigationController?.pushViewController(vc, animated:true)
    }
    func checkResponse(str : String) -> Void {
        print("잘 받았나?:\(str)")
    }
}
