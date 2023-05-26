//
//  NextPage.swift
//  EighthWeeks-Practice
//
//  Created by 정호진 on 2023/05/26.
//

import Foundation
import UIKit

final class NextPage: UIViewController{
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var searchUI: UISearchBar!
    @IBOutlet weak var top: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        move()
        
    }
    
    private func move(){
        UIView.animate(
            withDuration: 1,
            delay: 0,
            usingSpringWithDamping: 3,
            initialSpringVelocity: 3,
            options: [],
            animations: {
                let start = CGAffineTransform(translationX: 0, y: 0)
                let mvHeight =  CGAffineTransform(translationX: 0, y: self.img.frame.height)
                let rotate = CGAffineTransform(rotationAngle: .pi)
                
                let combine = start.concatenating(rotate).concatenating(mvHeight)
                self.searchUI.transform = combine
            },
            completion: { _ in
                UIView.animate(withDuration: 1, animations: {
                    let mvHeight =  CGAffineTransform(translationX: 0, y: self.img.frame.height)
                    
                    self.searchUI.transform = mvHeight
                    
                    self.view.layoutIfNeeded()
                })
            })
    }
}
