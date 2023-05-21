//
//  AlarmEditViewController.swift
//  UMC_seventhweekmission
//
//  Created by 신예진 on 2023/05/19.
//

import Foundation
import UIKit

protocol AlarmDelegate: AnyObject{
    func alarmDelegate(data: String)
}

class AlarmEditViewController:UIViewController{
    
    @IBOutlet weak var dismissbtn: UIButton!
    
    weak var delegate: AlarmDelegate?
    var alarmData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dismissTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissClicked))
        dismissbtn.addGestureRecognizer(dismissTapGesture)
        dismissbtn.isUserInteractionEnabled = true
    }
    
    @objc func dismissClicked(sender: UITapGestureRecognizer) {
            dismiss(animated: true)
        }
        
        @IBAction func saveButton(_ sender: UIButton) {
            guard let alarmData = alarmData else { return }
            self.delegate?.alarmDelegate(data: alarmData)
            print("저장버튼: \(alarmData)")
            print("delegate: \(delegate!)")
            self.navigationController?.popViewController(animated: true)
        }
        
        @IBAction func timePicker(_ sender: UIDatePicker) {
            let formatter = DateFormatter()
            formatter.dateFormat = "a hh:mm"
            formatter.locale = Locale(identifier: "ko_KR")
            alarmData = formatter.string(from: sender.date)
            print("alarmData: \(alarmData!)")
            
        }
    
    
    
}
