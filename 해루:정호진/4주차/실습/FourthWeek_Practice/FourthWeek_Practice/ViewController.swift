//
//  ViewController.swift
//  FourthWeek_Practice
//
//  Created by 정호진 on 2023/04/24.
//

import UIKit

final class ViewController: UIViewController {
    private let titleList: [String] = ["포미","음식"]
    private var receivedImg: UIImage?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell",for: indexPath) as! TableViewCell
        cell.inputTitle(title: titleList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row{
        case 0:
            performSegue(withIdentifier: "NextPageSegue", sender: indexPath.row)
        case 1:
            print("?")
        default:
            print("wrong")
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NextPageSegue" {
            let vc = segue.destination as! PictureController
            vc.delegate = self
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return titleList.count }
    
}

extension ViewController: SendImg{
    
    func sendImg(data: DataModel) {
        self.selectedImage.image = data.image.resize(newWidth: self.view.safeAreaLayoutGuide.layoutFrame.width/2)
        self.titleLabel.text = data.title
    }
    
}
