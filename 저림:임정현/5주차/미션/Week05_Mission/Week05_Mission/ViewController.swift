//
//  ViewController.swift
//  Week05_Mission
//
//  Created by 우주대스타 on 2023-05-07.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var waitingProgressBar: UIProgressView!
    @IBOutlet weak var progresButton: UIButton!
    var progressBarTimer: Timer!
    @IBOutlet weak var text: UILabel!
    var isRunning = false
    let animationView:LottieAnimationView = .init(name: "cat")
    
    @IBAction func buttonStart(_ sender: Any) {
        if(isRunning){
            progressBarTimer.invalidate()
            progresButton.setTitle("Start", for: .normal)
        }
        else{
            progresButton.setTitle("Stop", for: .normal)
            self.progressBarTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.updateProgressView), userInfo: nil, repeats: true)
            waitingProgressBar.progress = 0.0
            animationView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            animationView.stop()
        }
        isRunning = !isRunning
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        text.text = "UPLOADING....."
        waitingProgressBar.progress = 0.0
        waitingProgressBar.progressViewStyle = .default
        waitingProgressBar.layer.cornerRadius = 10
        waitingProgressBar.clipsToBounds = true
        waitingProgressBar.layer.sublayers![1].cornerRadius = 10
        waitingProgressBar.subviews[1].clipsToBounds = true
        
//         Do any additional setup after loading the view.
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
                text.text = "UPLOAD DONE!!!"
                
                animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
                animationView.frame = view.bounds
                animationView.contentMode = .scaleAspectFit
                animationView.loopMode = .loop
                animationView.animationSpeed = 0.5
                view.addSubview(animationView)
                animationView.isUserInteractionEnabled = false
                animationView.play()
                isRunning = false
            }
        }
}

