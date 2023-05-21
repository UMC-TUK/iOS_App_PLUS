//
//  AlarmTableViewCell.swift
//  week6_mission
//
//  Created by 이정동 on 2023/05/13.
//

import UIKit

protocol AlarmTableViewCellDelegate: AnyObject {
    func switchValueChanged(isOn: Bool, row: Int)
}

class AlarmTableViewCell: UITableViewCell {

    @IBOutlet weak var ampmLabel: UILabel!
    @IBOutlet weak var alarmTimeLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    var alarm: Alarm?
    var row: Int?
    
    weak var delegate: ViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupData() {
        guard let alarm = alarm else { print("guard err"); return }
        ampmLabel.text = alarm.ampm
        alarmTimeLabel.text = alarm.time
        alarmSwitch.isOn = alarm.isOn
    }

    @IBAction func alarmSwitchTapped(_ sender: UISwitch) {
        guard let row = row else { return }
        delegate?.switchValueChanged(isOn: sender.isOn, row: row)
    }
}
