//
//  SearchTableViewCell.swift
//  MovieApp
//
//  Created by 신예진 on 2023/01/19.
//

import Foundation
import UIKit

class SearchTableViewCell: UITableViewCell {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var yearLabel: UILabel!
  @IBOutlet weak var genreLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
