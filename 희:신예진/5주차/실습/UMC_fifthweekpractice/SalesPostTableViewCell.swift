//
//  SalesPostTableViewCell.swift
//  UMC_fifthweekpractice
//
//  Created by 신예진 on 2023/05/03.
//

import UIKit

class SalesPostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var cellTitle: UILabel!
    
    
    @IBOutlet weak var cellAddress: UILabel!
    
    @IBOutlet weak var cellPrice: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
