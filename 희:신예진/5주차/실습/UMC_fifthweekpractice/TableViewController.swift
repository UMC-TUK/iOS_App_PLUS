//
//  TableViewController.swift
//  UMC_fifthweekpractice
//
//  Created by 신예진 on 2023/05/03.
//

import Foundation
import UIKit

class TableViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    
    var arrImageName: [String] = ["1","2","3","4","5","6","7","8","9","10"]
    
    var arrFruitName: [String] = ["Apples","Apricots","Aubergines","Avocados","Bananas","Butternut squash","Cherries","Clementines","Dates","Elderberries"]

    var arrFruitInfo: [String] = ["Granny Smith, Royal Gala, Golden Delicious and Pink Lady are just a few of the thousands of kinds of apple that are grown around the world.","Apricots can be eaten fresh or dried – both are packed with vitamins. ","Most aubergines are teardrop-shaped and have glossy purple skin.","Sometimes called an avocado pear, this fruit is often mistakenly described as a vegetable because we eat it in salads.","A great snack in a handy yellow skin!","Butternut squash is a large and pear-shaped fruit with a golden-brown to yellow skin.","Cherries grow from stalks in pairs and a tree can produce fruit for as long as 100 years!","This citrus fruit is the smallest of the tangerines.","These fruits come from the date palm tree and grow abundantly in Egypt.","These little, almost black berries grow on bushes all over the UK countryside in summer."]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView에 Cell 등록
        let nibName = UINib(nibName: "FruitCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "FruitCell")
        initRefresh()
    }
    
    func initRefresh() {
           refreshControl.addTarget(self, action: #selector(refreshTable(refresh:)), for: .valueChanged)
           
           refreshControl.backgroundColor = .yellow
           refreshControl.tintColor = .purple
           refreshControl.attributedTitle = NSAttributedString(string: "당겨서 새로고침")
           
           tableView.refreshControl = refreshControl
       }
    
    @objc func refreshTable(refresh: UIRefreshControl) {
           print("새로고침 시작")
           
           DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
               self.tableView.reloadData()
               refresh.endRefreshing()
           }
       }
    
    
    
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    // TableView item 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrImageName.count
    }
    
    // TableView Cell의 Object
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FruitCell", for: indexPath) as! FruitCell
        
        cell.thumbnail.image = UIImage(named: arrImageName[indexPath.row])
        cell.lblName.text = arrFruitName[indexPath.row]
        cell.lblInfo.text = arrFruitInfo[indexPath.row]
        
        return cell
        
    }
}
