//
//  ViewController.swift
//  alarm
//
//  Created by gildong hong on 2023/05/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var countingDown: UISwitch!
    
    var timer = Timer()
    let timeInterval:TimeInterval = 0.05
    let timerEnd:TimeInterval = 10.0
    var timeCount:TimeInterval = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startTimer(_ sender: UIButton) {
        if !timer.isValid {
            timerLabel.text = timeString(time: timeCount)
            timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(timerDidEnd(timer:)), userInfo: "Pizza Done!!", repeats: true)
        }
    }
    @IBAction func countingDown(_ sender: UISwitch) {
        if !timer.isValid {
            resetTimeCount()
        }
    }
    
    @IBAction func stopTimer(_ sender: UIButton) {
        //timerLabel.text = "Timer Stopped"
        timer.invalidate()
    }
    @IBAction func resetTimer(_ sender: UIButton) {
        timer.invalidate()
        resetTimeCount()
        timerLabel.text = timeString(time: timeCount)
    }
    
    @objc func resetTimeCount() {
        if countingDown.isOn {
            timeCount = timerEnd
        } else {
            timeCount = 0.0
        }
    }
    
    @objc func timeString(time:TimeInterval) -> String {
    let minutes = Int(time) / 60
    let seconds = time - Double(minutes) * 60
    let secondsFraction = seconds - Double(Int(seconds))
        return String(format: "%02i:%02i.%01i", minutes, Int(seconds), Int(secondsFraction * 10.0))
    }
    
    @objc func timerDidEnd(timer:Timer) {
        // timerLabel.text = "Pizza Ready!!"
        if countingDown.isOn {
            timeCount = timeCount - timeInterval
            if timeCount <= 0 {
                timerLabel.text = "준비!!"
                timer.invalidate()
            } else {
                timerLabel.text = timeString(time: timeCount)
            }
        } else {
            timeCount = timeCount + timeInterval
            if timeCount >= timerEnd {
                timerLabel.text = "준비!!"
                timer.invalidate()
            } else {
                timerLabel.text = timeString(time: timeCount)
            }
        }
    }
}


