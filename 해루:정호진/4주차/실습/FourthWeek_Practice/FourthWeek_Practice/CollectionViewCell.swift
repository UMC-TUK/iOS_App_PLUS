//
//  CollectionViewCell.swift
//  FourthWeek_Practice
//
//  Created by 정호진 on 2023/04/24.
//

import Foundation
import UIKit

final class CollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var img: UIImageView!
    
    func inputImg(img: UIImage){
        self.img.image = img
    }
}
