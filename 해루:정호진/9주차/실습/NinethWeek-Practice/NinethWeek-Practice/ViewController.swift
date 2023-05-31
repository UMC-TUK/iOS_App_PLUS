//
//  ViewController.swift
//  NinethWeek-Practice
//
//  Created by 정호진 on 2023/05/31.
//

import UIKit

class ViewController: UIViewController {
    private let service = Service()
    private let key = "rrq71a2rotyj9tqm"
    
    @IBOutlet weak var textview: UITextView!
    private var titleList: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.getData(completion: gettingData, key: key)
    }
    
    func gettingData(list: [Item]){
        list.forEach { data in
            self.titleList.append("\(data.title)\n")
        }
        textview.text = titleList
        print("print done")
    }
   
    

}

