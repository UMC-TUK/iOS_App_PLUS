//
//  ViewController.swift
//  FourthWeek_Mission
//
//  Created by 정호진 on 2023/05/06.
//

import UIKit

final class ViewController: UIViewController {
    private var dataList: [List] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        inputData()
        
    }
    
    private func inputData(){
        dataList.append(List(colorList: [.blue,.cyan,.brown,.green],
                             name: "A"))
        dataList.append(List(colorList: [.white,.black,.darkGray,.lightGray],
                             name: "B"))
    }

}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 1 }
    
    func numberOfSections(in tableView: UITableView) -> Int { return dataList.count }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { return dataList[section].name}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.safeAreaLayoutGuide.layoutFrame.width/2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.setCollectionView()
        
        cell.getData(list: dataList[indexPath.section])
        return cell
    }
    
}

struct List {
    var colorList: [UIColor]
    var name: String
}

