//
//  AddingAlarmViewController.swift
//  week6_mission
//
//  Created by 이정동 on 2023/05/13.
//

import UIKit

struct CustomDateFormatter {
    static let shared = CustomDateFormatter()
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone.current
        formatter.timeStyle = .short
        return formatter
    }()
}

protocol AddingAlarmVCDelegate: AnyObject {
    func appendAlarmData(_ alarm: Alarm)
}

class AddingAlarmViewController: UIViewController {

    @IBOutlet weak var timePicker: UIDatePicker!
    
    weak var delegate: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        let timeStr = CustomDateFormatter.shared.formatter.string(from: timePicker.date)
        let timeStrArray = timeStr.components(separatedBy: " ")
        let alarmData = Alarm(ampm: timeStrArray[0], time: timeStrArray[1], isOn: true, dateTime: timePicker.date)
        delegate?.appendAlarmData(alarmData)
        dismiss(animated: true)
    }
    
}
