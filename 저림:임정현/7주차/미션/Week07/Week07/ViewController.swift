//
//  ViewController.swift
//  Week07
//
//  Created by 우주대스타 on 2023-05-22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    var timer = Timer()
    var isRunning = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let timeInfo = UserDefaults.standard.object(forKey: "timeData") as? Date{
            date.date = timeInfo
        }
        date.addTarget(self, action: #selector(didDatePickerValueChanged(_:)), for: .valueChanged)
        // Do any additional setup after loading the view.
    }
    
    @objc func didDatePickerValueChanged(_ sender: UIDatePicker) {
        UserDefaults.standard.set(sender.date, forKey: "timeData")
    }

    @IBAction func pressStartButton(_ sender: Any) {
        var countDownTime = Int(date.countDownDuration)
        isRunning = true
        DispatchQueue.global().async {
            let runLoop = RunLoop.current
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] timer in
                countDownTime -= 1
                DispatchQueue.main.async {
                    let hour = countDownTime / 3600
                    let minute = (countDownTime % 3600) / 60
                    let second = (countDownTime % 3600) % 60
                    self?.label.text = "⏰ \(hour)시간 \(minute)분 \(second)초 ⏰"
                }
                if countDownTime <= 0 {
                    self?.isRunning = false
                    timer.invalidate()
                    DispatchQueue.main.async {
                        self?.label.text = "알림 🔔"
                    }
                    return
                }
            })
            while self.isRunning {
                runLoop.run(until: Date().addingTimeInterval(1))
            }
            
        }
    }
    
    @IBAction func pressStopButton(_ sender: Any) {
        isRunning = false
        timer.invalidate()
        label.text = "알림 중지"
    }
}

