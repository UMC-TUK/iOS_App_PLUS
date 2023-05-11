//
//  AddNewAlarmController.swift
//  SixthWeek_Mission
//
//  Created by 정호진 on 2023/05/11.
//

import Foundation
import UIKit

final class AddNewAlarmController: UIViewController{
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveSwitch: UISwitch!
    @IBOutlet weak var saveBtn: UIButton!
    
    var delegate: SendAlarmInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func clickedSaveBtn(_ sender: Any) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let stringTime = formatter.string(from: datePicker.date)
        
        let hour = Int(stringTime.split(separator: ":")[0])!
        let minute = Int(stringTime.split(separator: ":")[1])!

        self.delegate?.sendAlarmInfo(hour: hour,
                                minute: minute,
                                check: saveSwitch.isOn)
        self.dismiss(animated: true)
    }
    
}

protocol SendAlarmInfo{
    func sendAlarmInfo(hour: Int, minute: Int, check: Bool)
}
