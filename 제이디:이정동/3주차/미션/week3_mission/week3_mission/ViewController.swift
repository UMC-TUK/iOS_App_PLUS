//
//  ViewController.swift
//  week3_mission
//
//  Created by 이정동 on 2023/04/13.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var totalTextView: UITextField!
    
    var records: [Record] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        containerView.layer.cornerRadius = 10
        tableView.layer.cornerRadius = 10
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func startButtonTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        vc.preview = self
        vc.total = Int(totalTextView.text ?? "0")
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count == 0 ? 1 : records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if records.count != 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as! ResultTableViewCell
            
            let record = records[indexPath.row]
            
            cell.total.text = "총 \(record.win + record.lose + record.draw)회"
            cell.result.text = "\(record.win)W \(record.draw)D \(record.lose)L"
            cell.resultStr.text = record.result
            cell.setupResultStrColor()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyTableViewCell", for: indexPath) as! EmptyTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if records.count != 0 {
            return 70
        } else {
            return tableView.frame.height
        }
    }
    
}
