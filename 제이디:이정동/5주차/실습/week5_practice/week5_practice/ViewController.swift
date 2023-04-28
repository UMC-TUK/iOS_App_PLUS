//
//  ViewController.swift
//  week5_practice
//
//  Created by 이정동 on 2023/04/27.
//

import UIKit
import Lottie
import SnapKit

class ViewController: UIViewController {
    
    private var animationView: LottieAnimationView!
    var backgroundView: UIView?
    
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    func startAnimationView() {
        backgroundView = UIView(frame: view.bounds)
        backgroundView?.backgroundColor = UIColor(white: 0, alpha: 0.5)
        view.addSubview(backgroundView!)
        animationView = .init(name: "refresh")
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.8
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        animationView.addGestureRecognizer(gesture)
        animationView.isUserInteractionEnabled = true
        
        backgroundView?.addSubview(animationView)
        animationView.play()
    }

    @objc func startButtonTapped() {
        startAnimationView()
    }
    
    @objc func tapped() {
        animationView.stop()
        backgroundView?.removeFromSuperview()
    }
}

