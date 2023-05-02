//
//  ViewController.swift
//  week5_mission
//
//  Created by 이정동 on 2023/05/02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataModel: [String] = []
    var count = 1
    
    let refreshControl = UIRefreshControl()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        // 해당 클로저에서 나중에 indicator 를 반환해주기 위해 상수형태로 선언
        let activityIndicator = UIActivityIndicatorView()
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        activityIndicator.center = self.view.center
        
        // 기타 옵션
        activityIndicator.tintColor = .black
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        
        // stopAnimating을 걸어주는 이유는, 최초에 해당 indicator가 선언되었을 때, 멈춘 상태로 있기 위해서
        activityIndicator.stopAnimating()
        
        return activityIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    private func setupView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(navigationButtonTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector((leftButtonTapped)))
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = tableView.estimatedRowHeight
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl) // not required when using UITableViewController
        
        self.view.addSubview(activityIndicator)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.dataModel.sort()
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    @objc func leftButtonTapped() {
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.dataModel.removeAll()
            self.tableView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
    
    @objc func navigationButtonTapped() {
        let group = DispatchGroup()
        
        (1...4).forEach { n in
            group.enter()
            DispatchQueue.global().async {
                print(n)
                self.dataModel.append(String(repeating: "\(n)", count: self.count))
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            self.count += 1
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.label.text = dataModel[indexPath.row]
        return cell
    }
    
    
}
