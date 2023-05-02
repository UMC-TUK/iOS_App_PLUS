//
//  CustomPopUpViewController.swift
//  UMC_fourthweekpractice
//
//  Created by 신예진 on 2023/05/03.
//

import Foundation
import UIKit

class CustomPopUpViewController: UIViewController{
    
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var bfBtn: UIButton!
    
    
    @IBOutlet weak var subsribeBtn: UIButton!
    
    
    @IBOutlet weak var openChatBtn: UIButton!
    
    
    @IBOutlet weak var blogBtn: UIButton!
    
    
    var subscribeBtnCompletionClosure: (() -> Void)?
    
    var myPopUpDelegate : PopUpDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomPopUpViewController - viewDidLoad() called")
        contentView.layer.cornerRadius = 30
        subsribeBtn.layer.cornerRadius = 10
        openChatBtn.layer.cornerRadius = 10
        blogBtn.layer.cornerRadius = 10
        
    }
    
    @IBAction func onBlogBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onBlogBtnClicked()")
//        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationName), object: nil)
//        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func onBgBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onBgBtnClicked() called")
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func onSubscribeBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onSubscribeBtnClicked() called")
        
        self.dismiss(animated: true, completion: nil)
        
        // 컴플레션 블럭 호출
        if let subscribeBtnCompletionClosure = subscribeBtnCompletionClosure{
            // 메인에 알린다.
            subscribeBtnCompletionClosure()
        }
    }
    
    
    @IBAction func onOpenChatBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onOpenChatBtnClicked() called")
        
        myPopUpDelegate?.onOpenChatBtnClicked()
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
