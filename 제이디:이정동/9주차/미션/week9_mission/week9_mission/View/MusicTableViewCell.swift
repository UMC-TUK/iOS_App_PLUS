//
//  MusicTableViewCell.swift
//  week9_mission
//
//  Created by 이정동 on 2023/06/21.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    @IBOutlet weak var singerLabel: UILabel!
    
    @IBOutlet weak var songLabel: UILabel!
    
    @IBOutlet weak var albumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
