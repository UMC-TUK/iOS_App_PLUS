//
//  ViewController.swift
//  week6_mission
//
//  Created by 이정동 on 2023/05/13.
//

import UIKit
import UserNotifications

struct Alarm {
    var ampm: String
    var time: String
    var isOn: Bool
    var dateTime: Date
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var alarmList: [Alarm] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupNavigationBar()
        setupTableView()
        startTimer()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAlarmButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .orange
    }
    
    func startTimer() {
        for index in 0..<alarmList.count {
            print(Date())
            print(alarmList[index].dateTime)
            let timeInterval = alarmList[index].dateTime.timeIntervalSince(Date())
            Timer.scheduledTimer(timeInterval: abs(timeInterval), target: self, selector: #selector(alertAlarm(_:)), userInfo: index, repeats: false)
            print(index)
        }
    }
    
    @objc func addAlarmButtonTapped() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "AddingAlarmViewController") as? AddingAlarmViewController else { return }
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @objc func alertAlarm(_ timer: Timer) {
        guard let index = timer.userInfo as? Int else { return }
        alarmList[index].isOn = false
        
        showAlertAction(alarmList[index])
    }
    
    func showAlertAction(_ alarm: Alarm) {
        let alert = UIAlertController(title: "알람", message: "\(alarm.ampm) \(alarm.time) 입니다", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default) { _ in
            self.tableView.reloadData()
        }
        alert.addAction(ok)
        present(alert, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmTableViewCell", for: indexPath) as? AlarmTableViewCell else { return UITableViewCell() }
        
        cell.delegate = self
        cell.alarm = alarmList[indexPath.row]
        cell.row = indexPath.row
        cell.setupData()
        
        return cell
    }
    
    
}

extension ViewController: AddingAlarmVCDelegate {
    func appendAlarmData(_ alarm: Alarm) {
        self.alarmList.append(alarm)
        self.alarmList.sort { $0.dateTime < $1.dateTime }
        self.tableView.reloadData()
        self.startTimer()
    }
}

extension ViewController: AlarmTableViewCellDelegate {
    func switchValueChanged(isOn: Bool, row: Int) {
        self.alarmList[row].isOn = isOn
    }
}
