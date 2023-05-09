//
//  ViewController.swift
//  Week4
//
//  Created by 이서영 on 2022/10/15.
//

import UIKit

struct MemoDataModel {
    var title: String
    var date: String
}

class ViewController: UIViewController {
    
    var memoData: [MemoDataModel] = [
        MemoDataModel(title: "메모입니다", date: "2023/5/8"),
        MemoDataModel(title: "APPLE", date: "2023/5/8"),
        MemoDataModel(title: "어버이날", date: "2023/5/8"),
        MemoDataModel(title: "🍯🍯", date: "2023/5/7"),
        MemoDataModel(title: "어린이날", date: "2022/05/5"),
        MemoDataModel(title: "휴강이다 얏호!!!", date: "2022/05/5"),
        MemoDataModel(title: "보강 리스트", date: "2022/05/5"),
        MemoDataModel(title: "UMC과제", date: "2022/05/3"),
        MemoDataModel(title: "4/5주차 과제ㅠㅠ", date: "2022/05/3"),
        MemoDataModel(title: "UMC", date: "2022/05/1"),
        MemoDataModel(title: "내일 한강 얏호", date: "2022/05/1"),
        MemoDataModel(title: "화공강", date: "2022/04/30")
    ]
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "메모"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: nil)
        
        tableView.layer.cornerRadius = 10
        tableView.layer.masksToBounds = true
        
        if #available(iOS 15.0, *) {
            tableView.tableHeaderView = UIView()
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell") as? MemoTableViewCell else {
            return UITableViewCell()
        }
        
        let data = memoData[indexPath.row]
        
        cell.titleLabel.text = data.title
        cell.dateLabel.text = data.date
        
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: tableView.bounds.width)
        }
        
        if indexPath.row == 3 {
            let config = UIImage.SymbolConfiguration(scale: .large)
            cell.heartButton.setImage(UIImage(systemName: "heart.fill")?.withConfiguration(config), for: .normal)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "UP", handler: {
            action, view, completionHandler in
            self.memoData.insert(self.memoData[indexPath.row], at: 0)
            self.memoData.remove(at: indexPath.row+1)
            tableView.moveRow(at: indexPath, to: IndexPath(row: 0, section: 0))
            completionHandler(true)
        })
        
        action.backgroundColor = .systemGreen
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "DELETE", handler: { action , view, completionHandler in
            self.memoData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        })
        
        action.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}
