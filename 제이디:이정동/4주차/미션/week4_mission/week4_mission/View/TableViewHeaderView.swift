//
//  TableViewHeaderView.swift
//  week4_mission
//
//  Created by 이정동 on 2023/05/02.
//

import UIKit

class TableViewHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var switchButton: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        switchButton.isOn = false
    }
}
