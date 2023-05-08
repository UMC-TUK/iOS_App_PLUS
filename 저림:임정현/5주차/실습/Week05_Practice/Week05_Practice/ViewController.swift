//
//  ViewController.swift
//  Week05_Practice
//
//  Created by 우주대스타 on 2023-05-04.
//

import UIKit
import Lottie

class ViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let animationView:LottieAnimationView = .init(name: "christmas-tree")
        animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        // Do any additional setup after loading the view.
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        view.addSubview(animationView)
        animationView.play()
    }

}

