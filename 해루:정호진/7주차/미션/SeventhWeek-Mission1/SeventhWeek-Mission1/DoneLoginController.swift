//
//  DoneLoginController.swift
//  SeventhWeek-Mission1
//
//  Created by 정호진 on 2023/05/20.
//

import Foundation
import UIKit
import Hero

final class DoneLoginController: UIViewController{
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isHeroEnabled = true
        self.hero.modalAnimationType = .selectBy(presenting: .auto, dismissing: .auto)
        
//        animateUI()
        UIView.animate(
            withDuration: 2,
            animations: {
                self.label.transform = CGAffineTransform(rotationAngle: .pi)
            },
            completion: { _ in
                let rotate = CGAffineTransform(rotationAngle: .zero)
                self.label.transform = rotate
        })
    }
    
    private func animateUI(){
      
    }
    
    @IBAction func clickedBack(_ sender: Any) {
        hero.dismissViewController()
    }
}
