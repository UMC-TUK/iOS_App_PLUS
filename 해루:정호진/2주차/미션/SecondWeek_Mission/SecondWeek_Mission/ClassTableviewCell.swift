//
//  ClassTableviewCell.swift
//  SecondWeek_Mission
//
//  Created by 정호진 on 2023/04/11.
//

import Foundation
import UIKit

final class ClassTableViewCell: UITableViewCell{
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var date: UILabel!
    
    func input(title: String, img: UIImage, date: String){
        self.title.text = title
        self.date.text = date
        let newWidth = 50
        let newHeight = 50
        let newImageRect = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        
        img.draw(in: newImageRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
        UIGraphicsEndImageContext()
        self.img.image = newImage
        
    }
    
    
}
