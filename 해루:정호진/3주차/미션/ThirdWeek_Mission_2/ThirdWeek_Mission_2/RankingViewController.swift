//
//  RankingViewController.swift
//  ThirdWeek_Mission_2
//
//  Created by 정호진 on 2023/04/23.
//

import Foundation
import UIKit

final class RankingViewController: UIViewController{
    var pointListArray: [Rank]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

extension RankingViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RankingTableViewCell",for: indexPath) as! RankingTableViewCell
        cell.selectionStyle = .none
        if let pointListArray = self.pointListArray {
            cell.inputText(rank: indexPath.section+1,
                           name: pointListArray[indexPath.section].name,
                           point: pointListArray[indexPath.section].point)
        }
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int { return pointListArray?.count ?? 0 }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 1 }
}

final class RankingTableViewCell: UITableViewCell{
    
    @IBOutlet weak var point: UILabel!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var name: UILabel!
    
    func inputText(rank: Int, name: String, point: Int){
        self.rank.text = "\(rank)등"
        self.name.text = name
        self.point.text = String(point)
    }
    
}
