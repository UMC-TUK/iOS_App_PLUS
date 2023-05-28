//
//  LastViewController.swift
//  UMC_seventhweekmission2
//
//  Created by 신예진 on 2023/05/28.
//

import UIKit
import Pastel

class LastViewController:UIViewController{
    
    
    @IBOutlet weak var pastelView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pastelView = PastelView(frame: view.bounds)
        
        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight
        
        pastelView.animationDuration = 3.0
        
        pastelView.setColors([UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                            UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                            UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0),
                            UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 1.0),
                            UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 1.0),
                            UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 1.0),
                            UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 1.0)])
        
        pastelView.startAnimation()
        view.insertSubview(pastelView, at: 0)
        
    }
}

