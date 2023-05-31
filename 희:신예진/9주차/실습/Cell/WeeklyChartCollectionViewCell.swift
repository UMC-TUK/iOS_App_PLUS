//
//  WeeklyChartCollectionViewCell.swift
//  MovieApp
//
//  Created by 신예진 on 2023/01/19.
//

import Foundation
import UIKit

class WeeklyChartCollectionViewCell: UICollectionViewCell {
    
  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var rankLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var salesLabel: UILabel!
  @IBOutlet weak var audiAccLabel: UILabel!
  
  override func prepareForReuse() {
    posterImageView.image = UIImage(named: "noImage")
  }
}
