//
//  MemoTableViewCell.swift
//  Week4
//
//  Created by 이서영 on 2022/10/15.
//

import UIKit

class MemoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        let config = UIImage.SymbolConfiguration(scale: .large)
        heartButton.setImage(UIImage(systemName: "heart")?.withConfiguration(config), for: .normal)
    }

}
