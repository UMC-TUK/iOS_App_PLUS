//
//  ViewController.swift
//  UMC_fourthweekpractice
//
//  Created by 신예진 on 2023/05/03.
//

import Foundation
import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "cell"
    
    let Korean: [String] = ["가","나","다","라","마","바","사","아","자","차","카","타","파","하"]
    let English : [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return Korean.count
        case 1:
            return English.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let text : String = indexPath.section == 0 ? Korean[indexPath.row] :
        English[indexPath.row]
        
        cell.textLabel?.text = text
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "한글" : "영어"
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            // 왼쪽에 만들기
            
            let like = UIContextualAction(style: .normal, title: "Like") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
                print("Like 클릭 됨")
                success(true)
            }
            like.backgroundColor = .systemPink
            like.image = UIImage(systemName: "hand.thumbsup")
            like.title = nil
            
            
            let share = UIContextualAction(style: .normal, title: "Share") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
                print("Share 클릭 됨")
                success(true)
            }
            share.backgroundColor = .systemTeal
            share.image = UIImage(systemName: "square.and.arrow.up")
            share.title = nil
            
            //actions배열 인덱스 0이 왼쪽에 붙어서 나옴
            return UISwipeActionsConfiguration(actions:[like, share])
            
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
    
}
