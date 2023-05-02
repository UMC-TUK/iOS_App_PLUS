//
//  TableViewCell.swift
//  week5_mission
//
//  Created by 이정동 on 2023/05/02.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
