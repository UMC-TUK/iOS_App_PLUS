////
////  ViewController.swift
////  UMC_8thweekpractice
////
////  Created by 신예진 on 2023/05/24.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    @IBOutlet weak var myView: UIImageView!
//
//
//    @IBOutlet weak var resetBtn: UIButton!
//
//
//    @IBOutlet weak var startBtn: UIButton!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//
//    @IBAction func reset(_ sender: Any) {
//        myView.backgroundColor = .orange
//        myView.alpha = 1.0
//        myView.frame = CGRect(x: 157, y: 77, width: 100, height: 100)
//
//
//
//    }
//
//
//    @IBAction func start(_ sender: Any) {
//        UIView.animate(withDuration: 5) {
//            self.myView.backgroundColor = .red
//            self.myView.alpha = 0.8
//            self.myView.frame = CGRect(x: 157, y: 398, width: 200, height: 200)
//        } completion: { finished in
//            UIView.animate(withDuration: 3) {
//                self.reset(sender)
//            }
//        }
//
//    }
//
//
//}
