//
//  ViewController.swift
//  Week02
//
//  Created by 우주대스타 on 2023-04-07.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var semesterButton2: UIButton!
    @IBOutlet weak var semesterButton: UIButton!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var attendanceButton: UIButton!
    @IBOutlet weak var lec1: UIView!
    @IBOutlet weak var lec2: UIView!
    @IBOutlet weak var lec3: UIView!
    @IBOutlet weak var lec4: UIView!
    @IBOutlet weak var Lec5: UIView!
    var timer: Timer!
    
    //    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
    
    @objc func timerProc(timer:Timer)
    {
        let date = Date()
        let formatter = DateFormatter();

        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let msg = formatter.string(from: date)

        time.text = msg
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lec1?.layer.borderWidth = 0.3
        lec1?.layer.borderColor = UIColor.gray.cgColor
        
        lec2?.layer.borderWidth = 0.3
        lec2?.layer.borderColor = UIColor.gray.cgColor
//        view.addSubview(semesterButton2)
        
        lec3?.layer.borderWidth = 0.3
        lec3?.layer.borderColor = UIColor.gray.cgColor
        
        lec4?.layer.borderWidth = 0.3
        lec4?.layer.borderColor = UIColor.gray.cgColor
        
        Lec5?.layer.borderWidth = 0.3
        Lec5?.layer.borderColor = UIColor.gray.cgColor
        
        let s23_1 = UIAction(title: "23-1",  handler: { _ in print("23-1") })
        let s22_2 = UIAction(title: "22-2",  handler: { _ in print("22-2") })
        let s22_1 = UIAction(title: "22-1",  handler: { _ in print("22-1") })
        let s21_2 = UIAction(title: "21-2",  handler: { _ in print("21-2") })
        let s21_1 = UIAction(title: "21-1",  handler: { _ in print("21-1") })
        semesterButton2?.menu = UIMenu(title: "학기 선택",
                             image: UIImage(systemName: "heart"),
                             identifier: nil,
                             options: .displayInline,
                             children: [s23_1, s22_2, s22_1, s21_2, s21_1])
        self.semesterButton2?.showsMenuAsPrimaryAction = true
        self.semesterButton2?.changesSelectionAsPrimaryAction = true
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerProc), userInfo: nil, repeats: true)
        
        attendanceButton.configurationUpdateHandler = { attendanceButton in
              var config = attendanceButton.configuration
              config?.image = attendanceButton.isHighlighted ? UIImage(systemName: "checkmark.circle.fill"): UIImage(systemName: "checkmark.circle")
            attendanceButton.translatesAutoresizingMaskIntoConstraints = false
            attendanceButton.configuration = config
        }
    }

}

