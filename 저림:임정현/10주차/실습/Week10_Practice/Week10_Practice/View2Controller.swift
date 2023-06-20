//
//  View2Controller.swift
//  Week10_Practice
//
//  Created by 우주대스타 on 2023-06-20.
//

import UIKit

class View2Controller: UIViewController {
    let info = MyInfo.shared
    
    @IBOutlet weak var VC2Label1: UILabel!
    @IBOutlet weak var VC2Label2: UILabel!
    @IBOutlet weak var VC2Label3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        info.age = 23
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if let str = info.name {
            VC2Label1.text = "MyInfo name \(str)"
        }else {
            VC2Label1.text = "MyInfo name => nil"
        }
        
        if let int = info.age {
            VC2Label2.text = "MyInfo age \(int)"
        }else {
            VC2Label2.text = "MyInfo age => nil"
        }
        
        if let bool = info.female {
            VC2Label3.text = "MyInfo female \(bool)"
        }else {
            VC2Label3.text = "MyInfo female => nil"
        }
    }

    @IBAction func nextAction(_ sender: Any) {
        guard let pushVC = self.storyboard?.instantiateViewController(identifier: "View3Controller") as? View3Controller else{
            return
        }
        
        self.navigationController?.pushViewController(pushVC, animated: true)
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
