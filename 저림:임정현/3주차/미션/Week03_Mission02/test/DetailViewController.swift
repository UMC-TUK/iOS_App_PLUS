//
//  DetailViewController.swift
//  test
//
//  Created by 우주대스타 on 2023-05-01.
//

import UIKit

class DetailViewController: UIViewController {
    
    var memo: MemoList?
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        f.locale = Locale(identifier: "Ko_kr")
        return f
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
           case 0:
               let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
               
               cell.textLabel?.text = memo?.title
               
               return cell
           case 1:
               let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
               
               cell.textLabel?.text = formatter.string(for: memo?.insertDate)
               
               return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
            
            cell.textLabel?.text = memo?.content
            
            return cell
           default:
               fatalError()
           }
    }
    
    
}
