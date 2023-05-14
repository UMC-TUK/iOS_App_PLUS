//
//  ViewController.swift
//  Week05_Practice
//
//  Created by 우주대스타 on 2023-05-04.
//

import UIKit
import Lottie

class ViewController: UIViewController {
<<<<<<< HEAD
  
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
=======
    @IBOutlet weak var progressBtn: UIButton!
    @IBOutlet weak var progressButton: UIButton!
    @IBOutlet weak var waitingProgressBar: UIProgressView!
    var progressBarTimer: Timer!
    var isRunning = false
    
    @IBAction func buttonStart(_ sender: Any) {
        if(isRunning){
            progressBarTimer.invalidate()
            progressBtn.setTitle("Start", for: .normal)
        }
        else{
            progressBtn.setTitle("Stop", for: .normal)
            self.progressBarTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.updateProgressView), userInfo: nil, repeats: true)
            waitingProgressBar.progress = 0.0
        }
        isRunning = !isRunning
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        waitingProgressBar.progress = 0.1
        waitingProgressBar.progressViewStyle = .default
        waitingProgressBar.layer.cornerRadius = 10
        waitingProgressBar.clipsToBounds = true
        waitingProgressBar.layer.sublayers![1].cornerRadius = 10
        waitingProgressBar.subviews[1].clipsToBounds = true
        
    }
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    @objc func updateProgressView(){
        waitingProgressBar.progress += 0.1
        waitingProgressBar.setProgress(waitingProgressBar.progress, animated: true)
            if(waitingProgressBar.progress == 1.0)
            {
                progressBarTimer.invalidate()
                let animationView:LottieAnimationView = .init(name: "christmas-tree")
                animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
                // Do any additional setup after loading the view.
                animationView.frame = view.bounds
                animationView.contentMode = .scaleAspectFit
                animationView.loopMode = .loop
                animationView.animationSpeed = 0.5
                view.addSubview(animationView)
                animationView.play()
                isRunning = false
            }
        }
>>>>>>> b6f7e349d70f0176eaf93ae56d72aa97688d6eb8

}

