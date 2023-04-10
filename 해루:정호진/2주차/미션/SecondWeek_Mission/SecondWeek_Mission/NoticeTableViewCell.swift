//
//  NoticeTableViewCell.swift
//  SecondWeek_Mission
//
//  Created by 정호진 on 2023/04/11.
//

import Foundation
import UIKit

final class NoticeTableViewCell: UITableViewCell{
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var title: UILabel!
    
    func input(title: String, date: String){
        self.title.text = title
        self.date.text = date
    }
    
}
