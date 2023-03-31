//
//  BottomCollectionViewCell.swift
//  week1_mission
//
//  Created by 이정동 on 2023/03/31.
//

import UIKit

class BottomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var cartButton: UIButton!
    
    @IBOutlet weak var seperate: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cartButton.layer.cornerRadius = cartButton.frame.width / 2
        
    }
}
