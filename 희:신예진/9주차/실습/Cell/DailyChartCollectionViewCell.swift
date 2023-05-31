//
//  DailyChartCollectionViewCell.swift
//  MovieApp
//
//  Created by 신예진 on 2023/01/19.
//

import Foundation
import UIKit

class DailyChartCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var audiAccLabel: UILabel!
  @IBOutlet weak var rankLabel: UILabel!
  @IBOutlet weak var salesLabel: UILabel!
  
  override func prepareForReuse() {
    posterImageView.image = UIImage(named: "noImage")
  }
}
