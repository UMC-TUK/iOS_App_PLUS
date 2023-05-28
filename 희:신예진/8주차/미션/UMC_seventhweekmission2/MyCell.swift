//
//  MyCell.swift
//  UMC_seventhweekmission2
//
//  Created by 신예진 on 2023/05/28.
//

import Foundation
import UIKit
import Gemini

class MyCell: GeminiCell{
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    func setCell(imageName:String){
        
        mainImageView.image = UIImage(named: imageName)
        
    }
}
