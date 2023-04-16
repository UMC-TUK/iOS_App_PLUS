//
//  DetailViewController.swift
//  UMC_thirdweekmission
//
//  Created by 신예진 on 2023/04/16.
//

import Foundation
import UIKit

class DetailViewController:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension DetailViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "contentsCell", for: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
            return cell
        default:
            fatalError()
        }
    }
}
