//
//  ViewController.swift
//  SixthWeek_Mission
//
//  Created by 정호진 on 2023/05/11.
//

import UIKit

final class ViewController: UIViewController {
    private var alarmInfoList: [AlarmInfo] = []
    private let userdefaultKey = "Alarm"
    private let colors: [UIColor] = [.white, .yellow, .blue, .green]
    @IBOutlet weak var tableView: UITableView!
    private var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "알람"
        
        self.alarmInfoList = load()
        self.alarmInfoList.forEach { data in
            print("\(data.hour) , \(data.minute), \(data.check)")
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(self.alarmInfoList)
        saveData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? AddNewAlarmController{
            viewController.delegate = self
        }
    }
    
    private func saveData(){
        
        let data = self.alarmInfoList.map { try? JSONEncoder().encode($0)}
        UserDefaults.standard.set(data, forKey: userdefaultKey)
    }
    
    private func load() -> [AlarmInfo]{
        guard let data = UserDefaults.standard.array(forKey: userdefaultKey) as? [Data] else {return []}
        
        return data.map { try! JSONDecoder().decode(AlarmInfo.self, from: $0) }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.inputInfo(hour: alarmInfoList[indexPath.row].hour,
                       minute: alarmInfoList[indexPath.row].minute,
                       check: alarmInfoList[indexPath.row].check)
        cell.backgroundColor = .clear
        cell.checkAlarmSwitch.addTarget(self, action: #selector(clickedSwitch), for: .valueChanged)
        cell.checkAlarmSwitch.tag = indexPath.row
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
    
    @objc
    private func clickedSwitch(_ sender: UISwitch){
        self.alarmInfoList[sender.tag].check = sender.isOn
    }
    
}

extension ViewController: SendAlarmInfo{
    func sendAlarmInfo(hour: Int, minute: Int, check: Bool) {
        alarmInfoList.append(AlarmInfo(hour: hour, minute: minute, check: check))
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
}


struct AlarmInfo: Codable{
    var hour: Int
    var minute: Int
    var check: Bool
}

struct AlarmInfoCodable: Codable{
    let hour: Int
    let minute: Int
    let check: Bool
}
