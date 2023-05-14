//
//  ViewController.swift
//  Week04_Mission
//
//  Created by 우주대스타 on 2023-05-08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let data = [
    ["Apple", "MacOS", "iOS", "iPadOS"],
    ["one", "two", "three", "four"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let header = UIView(frame: CGRect(x:0, y:0, width: view.frame.size.width, height: 150))
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 150))
        
        header.backgroundColor = .systemOrange
        footer.backgroundColor = .systemBlue
        
        let headerLabel = UILabel(frame: header.bounds)
        headerLabel.text = "Header"
        headerLabel.textAlignment = .center
        header.addSubview(headerLabel)
        
        let footerLabel = UILabel(frame: footer.bounds)
        footerLabel.text = "Footer"
        footerLabel.textAlignment = .center
        footer.addSubview(footerLabel)
        
        tableView.tableHeaderView = header
        tableView.tableFooterView = footer
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> CGFloat? {
        return 20.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInsection section: Int) -> String? {
        return "Section Header"
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInsection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInsection section: Int) -> String? {
        return "Section Footer"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        cell.backgroundColor = .systemGray
        
        return cell
    }
}

