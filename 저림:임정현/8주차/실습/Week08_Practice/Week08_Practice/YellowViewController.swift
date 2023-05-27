//
//  YellowViewController.swift
//  Week08_Practice
//
//  Created by 우주대스타 on 2023-05-27.
//

import UIKit

class YellowViewController: UIViewController {

    @IBOutlet weak var yellowView: UIView!
//    @IBOutlet weak var yellowViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var yellowViewHeightContraint: NSLayoutConstraint!
    @IBOutlet var yellowViewSwipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet var yellowViewLongPressGestureRecognizer: UILongPressGestureRecognizer!
    
    var flag = false
    var flag_1 = false
    var flag_2 = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(yellowViewDidTap))
        yellowView.addGestureRecognizer(tapGestureRecognizer)
//        yellowViewTapGestureRecognizer.addTarget(self, action: #selector(yellowViewDidTap))
//        let swipeGestureRecognizer: Void = yellowViewSwipeGestureRecognizer.addTarget(self, action: #selector(yellowViewDidSwipe))
//        yellowView.addGestureRecognizer(tapGestureRecognizer)
        yellowViewSwipeGestureRecognizer.addTarget(self, action: #selector(yellowViewDidSwipe))
        yellowViewLongPressGestureRecognizer.addTarget(self, action: #selector(yellowViewDidLongPress))
        // Do any additional setup after loading the view.
    }
    

    @objc func yellowViewDidTap(){
        if !flag {
            UIView.animate(withDuration: 3, animations: {
//                self.yellowViewTopConstraint.constant = 50
                self.yellowViewHeightContraint.constant = 500
                self.view.layoutIfNeeded()
            },
            completion: { _ in
                self.flag = true
                }
            )
        }else {
            UIView.animate(withDuration: 3,
                           animations : {
//                self.yellowViewTopConstraint.constant = 199
                self.yellowViewHeightContraint.constant = 128
                self.view.layoutIfNeeded()
            },
            completion: { _ in
                self.flag = false
            })
        }
    }
    
    @objc func yellowViewDidSwipe() {
        if !flag_1 {
            UIView.animate(withDuration: 1,
            animations: {
                self.yellowView.backgroundColor = UIColor.green
                self.view.layoutIfNeeded()
            },
            completion : { _ in
                self.flag_1 = true
            })
        } else {
            UIView.animate(withDuration: 1,
                           animations: {
                self.yellowView.backgroundColor = UIColor.yellow
                self.view.layoutIfNeeded()
            },
            completion : { _ in
                self.flag_1 = false
            })
        }
    }
    
    @objc func yellowViewDidLongPress() {
        if !flag_2 {
            UIView.animate ( withDuration: 1,
                             animations: {
                self.yellowView.alpha = 0
                self.view.layoutIfNeeded()
            },
            completion: { _ in
                self.flag_2 = true
            })
        } else {
            UIView.animate ( withDuration : 1,
                             animations: {
                self.yellowView.alpha = 1
                self.view.layoutIfNeeded()
            },
            completion: { _ in
                self.flag_2 = false
            })
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
