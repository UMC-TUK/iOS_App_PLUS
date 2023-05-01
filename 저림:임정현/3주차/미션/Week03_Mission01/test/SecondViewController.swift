//
//  SecondViewController.swift
//  test
//
//  Created by 우주대스타 on 2023-05-01.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var resultText: UILabel!
    var data:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultText.text = data
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
