//
//  AddViewController.swift
//  UMC_thirdweekmission
//
//  Created by 신예진 on 2023/04/16.
//

import Foundation
import UIKit

class AddViewController:UIViewController{
    
    
    @IBOutlet weak var tvContents: UITextView!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }
    
    @IBAction func btnSave(_ sender: UIBarButtonItem) {
        if tvContents.text.isEmpty {
                    alert(message: "Writing Memo Plz~")
                }
                else{
                    let newMemo = MemoContents(contents: tvContents.text)
                    MemoContents.imsiList.append(newMemo)
                    
                    navigationController?.popViewController(animated: true
                    )
                }
    }
    
    func alert(title : String = "⚠️", message: String) {
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let btnOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(btnOk)
            
            present(alert, animated: true, completion: nil)
        }
    

    
}
