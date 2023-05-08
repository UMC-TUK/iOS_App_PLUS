//
//  MovieCell.swift
//  UMC_fourth1weekmission
//
//  Created by 신예진 on 2023/05/06.
//

import Foundation
import UIKit

struct Movie{
    var movieImage:String?
    var movieName:String?
    var num:String?
}

class MovieCell: UITableViewCell{
    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var num: UILabel!
    
    
    @IBOutlet weak var heartbtn: UIButton!
    
    //재활용 셀 중첩오류 해결법
    override func prepareForReuse() {
        movieImage.image = nil
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
