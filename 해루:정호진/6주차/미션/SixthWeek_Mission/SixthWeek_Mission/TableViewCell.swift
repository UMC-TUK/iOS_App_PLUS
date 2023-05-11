//
//  TableViewCell.swift
//  SixthWeek_Mission
//
//  Created by 정호진 on 2023/05/11.
//

import Foundation
import UIKit

final class TableViewCell: UITableViewCell{
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var checkAlarmSwitch: UISwitch!
    
    
    func inputInfo(hour: Int, minute: Int, check: Bool){
        var stringHour = "\(hour):"
        var stringMinute = "\(minute)"
        if hour<10{
            stringHour = "0\(hour):"
        }
        if minute<10{
            stringMinute = "0\(minute)"
        }
        
        hourLabel.text = stringHour
        minuteLabel.text = stringMinute
        checkAlarmSwitch.isOn = check
        
    }
    
    func changeLabelColor(color: UIColor, check: Bool){
        self.hourLabel.textColor = color
        self.minuteLabel.textColor = color
        self.checkAlarmSwitch.isOn = check
    }
    
}
