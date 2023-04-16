//
//  TableTableViewController.swift
//  UMC_thirdweekmission
//
//  Created by 신예진 on 2023/04/16.
//

import Foundation
import UIKit

class TableTableViewController: UITableViewController{
    
    let formatter : DateFormatter = {
            let format = DateFormatter()
            format.dateStyle = .short
            format.timeStyle = .short
            return format
            }()
    
    override func viewWillAppear(_ animated: Bool) {
           tableView.reloadData()
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return MemoContents.imsiList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        let target = MemoContents.imsiList[indexPath.row]   // indexPath.row에 접근하여 몇번째 셀인지 알 수 있고, 해당 번째의 배열을 호출한다.
        
        cell.textLabel?.text = target.contents              // subtitle : 내용
        cell.detailTextLabel?.text = target.date.description // subtitle : 날짜
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {     // segue를 통해 화면이 전환되기 직전에 호출되는 메서드
            if segue.identifier == "sgDetail"{
                let detailView = segue.destination as! DetailViewController
                let cell = sender as! UITableViewCell
//                let indexPath = self.tvContents.indexPath(for: cell)
//                detailView.MemoContents = MemoContents.imsiList[indexPath!.row]
                }
            }
}
