//
//  RelodViewController.swift
//  Week05_Practice
//
//  Created by 우주대스타 on 2023-05-07.
//

import UIKit

class RelodViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataList : [String] = ["가","나","다","라","마"]
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initRefreshControl()

        // Do any additional setup after loading the view.
    }
    func initRefreshControl(){
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(handleRefreshControl), for: UIControl.Event.valueChanged)
      }
//    func addTarget(
//     _ target: Any?,
//     action: Selector,
//     for controlEvents: UIControl.Event
//    )
    @objc func handleRefreshControl(){
            //새로고침 작동할 때 어떤 기능을 넣을 것인가
            //Update your content
            print("새로고침 됨!!!!")
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

