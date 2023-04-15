//
//  RecordTableViewCell.swift
//  week3_mission
//
//  Created by 이정동 on 2023/04/13.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var resultStr: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupResultStrColor() {
        switch resultStr.text! {
        case "승": resultStr.textColor = .blue
        case "무": resultStr.textColor = .lightGray
        case "패": resultStr.textColor = .red
        default: return
        }
    }
}
