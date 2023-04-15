//
//  EmptyTableViewCell.swift
//  week3_mission
//
//  Created by 이정동 on 2023/04/13.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {

    
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
