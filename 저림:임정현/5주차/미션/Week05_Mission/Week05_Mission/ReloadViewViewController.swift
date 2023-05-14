//
//  ReloadViewViewController.swift
//  Week05_Mission
//
//  Created by 우주대스타 on 2023-05-08.
//

import UIKit

class ReloadViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var tableView: UITableView!
    let refreshControl = UIRefreshControl()
    
    var data = [String]()
    var filteredData = [String]()
    var filetered = false
    let emoji : [String] = ["⭐️", "🍏", "🍯", "🍓", "🥑"]
    let dream : [String] = ["Apple", "Naver", "Kakao", "Amazon", "Google"]
    @IBAction func field(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
        setupData()
        initRefreshControl()
        // Do any additional setup after loading the view.
    }
    
    private func setupData()
    {
        data.append("Apple")
        data.append("Naver")
        data.append("Kakao")
        data.append("Amazon")
        data.append("Google")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string:String) -> Bool {
        if let text = textField.text {
            filterText(text+string)
        }
        return true
    }
    
    func filterText(_ query: String) {
        filteredData.removeAll()
        
        for string in data {
            if string.lowercased().starts(with: query.lowercased())
            {
                filteredData.append(string)
            }
        }
        tableView.reloadData()
        filetered = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredData.isEmpty {
            return filteredData.count
        }
        return filetered ? 0 : data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if !filteredData.isEmpty {
            cell.textLabel?.text = filteredData[indexPath.row]
        }
        else {
            cell.textLabel?.text = data[indexPath.row]
        }
        return cell
    }
    
    
    func initRefreshControl(){
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(handleRefreshControl), for: UIControl.Event.valueChanged)
      }
    
    @objc func handleRefreshControl(){
            //새로고침 작동할 때 어떤 기능을 넣을 것인가
            //Update your content
        print("새로고침 됨!!!!")
        
        let idx = Int.random(in: 0...4)
        filteredData.append(dream[idx] + emoji[idx])
        tableView.reloadData()
            //Dismiss the refresh control
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { //delay 보여주기
                self.refreshControl.endRefreshing()
            }
            //스레드 관리하는 내용
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
