//
//  ViewController.swift
//  SixthWeek_Mission
//
//  Created by 정호진 on 2023/05/11.
//

import UIKit

final class ViewController: UIViewController {
    private var alarmInfoList: [AlarmInfo] = []
    private let colors: [UIColor] = [.white, .yellow, .blue, .green]
    @IBOutlet weak var tableView: UITableView!
    private var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "알람"
        changeColor()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? AddNewAlarmController{
            viewController.delegate = self
        }
    }
    
    private func changeColor(){
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.view.backgroundColor = self.colors[self.index]
            self.tableView.backgroundColor = self.colors[self.index]
            self.index = (self.index + 1) % 4
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.inputInfo(hour: alarmInfoList[indexPath.row].hour,
                       minute: alarmInfoList[indexPath.row].minute,
                       check: alarmInfoList[indexPath.row].check)
        cell.backgroundColor = .clear

        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "삭제") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            self.alarmInfoList.remove(at: indexPath.row)
            tableView.reloadData()
            success(true)
        }
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.safeAreaLayoutGuide.layoutFrame.height/10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return alarmInfoList.count }
    
}

extension ViewController: SendAlarmInfo{
    func sendAlarmInfo(hour: Int, minute: Int, check: Bool) {
        alarmInfoList.append(AlarmInfo(hour: hour, minute: minute, check: check))
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
}


struct AlarmInfo{
    let hour: Int
    let minute: Int
    let check: Bool
}
