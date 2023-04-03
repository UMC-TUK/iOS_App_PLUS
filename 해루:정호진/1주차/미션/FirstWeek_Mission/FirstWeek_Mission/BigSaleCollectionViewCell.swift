//
//  BigSaleCollectionViewCell.swift
//  FirstWeek_Mission
//
//  Created by 정호진 on 2023/04/03.
//

import Foundation
import UIKit

final class BigSaleCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var img: UIImageView!
    
    // MARK: 이미지 렌더링 후 넣기
    func renderingImg(img: UIImage){
        let newWidth = 100
        let newHeight = 300
        let newImageRect = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        
        img.draw(in: newImageRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
        UIGraphicsEndImageContext()
        self.img.image = newImage
    }
    
}
