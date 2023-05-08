//
//  SecondViewController.swift
//  UMC_fifthweekmission
//
//  Created by 신예진 on 2023/05/06.
//

import UIKit
import Lottie

class SecondViewController: UIViewController{
    

    let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Music", "Cart"])
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
      }()
      let firstView: UIView = {
          
        let view = UIView()
        let animation = LottieAnimation.named("92815-mo-music")
        let animationView = LottieAnimationView(animation: animation)
        animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 500)
//        animationView.center = view.center
        view.addSubview(animationView)
//        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        animationView.play()
        animationView.loopMode = .loop
        return view
      }()
      let secondView: UIView = {
        let view = UIView()
        let animation = LottieAnimation.named("40509-shopping-bag")
        let animationView = LottieAnimationView(animation: animation)
        animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 500)
//        animationView.center = view.center
        view.addSubview(animationView)
//        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        animationView.play()
        animationView.loopMode = .loop
        return view
      }()
    
    var shouldHideFirstView: Bool? {
        didSet {
          guard let shouldHideFirstView = self.shouldHideFirstView else { return }
          self.firstView.isHidden = shouldHideFirstView
          self.secondView.isHidden = !self.firstView.isHidden
        }
      }
    
    override func viewDidLoad() {
            super.viewDidLoad()
//        //로티 애니메이션 띄우기
//        let animation = LottieAnimation.named("92815-mo-music")
//        let animationView = LottieAnimationView(animation: animation)
//        animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 500)
//        animationView.center = view.center
//        view.addSubview(animationView)
//
//        animationView.play()
//        animationView.loopMode = .loop
        
        
        self.view.addSubview(self.segmentedControl)
        self.view.addSubview(self.firstView)
        self.view.addSubview(self.secondView)
        
        
        NSLayoutConstraint.activate([
              self.segmentedControl.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
              self.segmentedControl.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
              self.segmentedControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80),
              self.segmentedControl.heightAnchor.constraint(equalToConstant: 70),
            ])
        NSLayoutConstraint.activate([
              self.firstView.leftAnchor.constraint(equalTo: self.segmentedControl.leftAnchor),
              self.firstView.rightAnchor.constraint(equalTo: self.segmentedControl.rightAnchor),
              self.firstView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80),
              self.firstView.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor, constant: 16),
            ])
        NSLayoutConstraint.activate([
              self.secondView.leftAnchor.constraint(equalTo: self.firstView.leftAnchor),
              self.secondView.rightAnchor.constraint(equalTo: self.firstView.rightAnchor),
              self.secondView.bottomAnchor.constraint(equalTo: self.firstView.bottomAnchor),
              self.secondView.topAnchor.constraint(equalTo: self.firstView.topAnchor),
            ])
            
            self.segmentedControl.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
            
            self.segmentedControl.selectedSegmentIndex = 0
            self.didChangeValue(segment: self.segmentedControl)
        
            
    
        }
    
    @objc private func didChangeValue(segment: UISegmentedControl) {
        self.shouldHideFirstView = segment.selectedSegmentIndex != 0
      }
    
    
}
