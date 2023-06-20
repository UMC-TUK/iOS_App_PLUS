//
//  View3Controller.swift
//  Week10_Practice
//
//  Created by 우주대스타 on 2023-06-20.
//

import UIKit

class View3Controller: UIViewController {
    let info = MyInfo.shared
    
    @IBOutlet weak var VC3Label1: UILabel!
    @IBOutlet weak var VC3Label2: UILabel!
    @IBOutlet weak var VC3Label3: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        info.female = true

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let str = info.name {
            VC3Label1.text = "MyInfo name \(str)"
        }else {
            VC3Label1.text = "MyInfo name => nil"
        }
        
        if let int = info.age {
            VC3Label2.text = "MyInfo age \(int)"
        }else {
            VC3Label2.text = "MyInfo age => nil"
        }
        
        if let bool = info.female {
            VC3Label3.text = "MyInfo female \(bool)"
        }else {
            VC3Label3.text = "MyInfo female => nil"
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

}
