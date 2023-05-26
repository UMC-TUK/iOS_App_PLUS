//
//  ViewController.swift
//  week8_practice
//
//  Created by 이정동 on 2023/05/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var subView: UIView!
    
    @IBOutlet weak var subViewHeight: NSLayoutConstraint!
    @IBOutlet weak var subViewWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        subView.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(doPinch(_:))))
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(doTap(_:)))
        tapGesture.numberOfTapsRequired = 2
        subView.addGestureRecognizer(tapGesture)
    }
    
    @objc func doTap(_ tap: UITapGestureRecognizer) {
        if subView.frame.width == 120 {
            subViewWidth.constant = 240
            subViewHeight.constant = 240
        } else {
            subViewWidth.constant = 120
            subViewHeight.constant = 120
        }

        UIView.animate(withDuration: 2) {
            if self.view.backgroundColor == .yellow {
                self.view.backgroundColor = .white
            } else {
                self.view.backgroundColor = .yellow
            }
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        
        switch pinch.state {
        case .changed:
            subView.transform = subView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
            pinch.scale = 1
        case .ended:
            UIView.animate(withDuration: 0.5) {
                self.subView.transform = .identity
            }
        default:
            break
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if subView.frame.width == 120 {
            subViewWidth.constant = 240
            subViewHeight.constant = 240
        } else {
            subViewWidth.constant = 120
            subViewHeight.constant = 120
        }

        UIView.animate(withDuration: 2) {
            if self.view.backgroundColor == .yellow {
                self.view.backgroundColor = .white
            } else {
                self.view.backgroundColor = .yellow
            }
            self.view.layoutIfNeeded()
        }
    }
    
}

