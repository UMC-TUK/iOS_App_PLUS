//
//  TableViewCell.swift
//  FourthWeek_Practice
//
//  Created by 정호진 on 2023/04/24.
//

import Foundation
import UIKit

final class TableViewCell: UITableViewCell{
    @IBOutlet weak var title: UILabel!
    
    func inputTitle(title: String){
        self.title.text = title
    }
    
}
