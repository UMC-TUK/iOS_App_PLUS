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
    
    func shakingAnimation() {
        let shakingKeyframe = CAKeyframeAnimation(keyPath: "position.x")
        shakingKeyframe.values = [0, 5, -5, 5, 2, 2, -2, 0]
        shakingKeyframe.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1]
        shakingKeyframe.duration = 0.4
        shakingKeyframe.isAdditive = true // true이면 values가 현재 위치 기준, false이면 values가 Screen좌표 기준
        self.layer.add(shakingKeyframe, forKey: "shaking")
    }

    @IBAction func alarmSwitchTapped(_ sender: UISwitch) {
        guard let row = row else { return }
        shakingAnimation()
        delegate?.switchValueChanged(isOn: sender.isOn, row: row)
    }
}
