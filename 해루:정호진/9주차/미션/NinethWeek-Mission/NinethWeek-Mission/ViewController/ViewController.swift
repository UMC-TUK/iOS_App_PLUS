//
//  ViewController.swift
//  NinethWeek-Mission
//
//  Created by 정호진 on 2023/06/04.
//

import UIKit

class ViewController: UIViewController {
    private var list: [Item] = []
    private let viewModel = ViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getData(completion: getData(data:))
        
    }

    // MARK: get tour list
    private func getData(data: [Item]){
        list = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell",for: indexPath) as? CustomTableViewCell else { return UITableViewCell()}
        
        cell.layer.cornerRadius = 20
        cell.backgroundColor = UIColor(red: 247/255, green: 185/255, blue: 0/255, alpha: 1.0) /* #f7b900 */
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        cell.inputData(imgPath: (list[indexPath.section].repPhoto?.photoid.thumbnailpath)!,
                       title: list[indexPath.section].title)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 1 }
    func numberOfSections(in tableView: UITableView) -> Int { return list.count }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.safeAreaLayoutGuide.layoutFrame.height/4
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { return 1 }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { return " " }
    
    
}

