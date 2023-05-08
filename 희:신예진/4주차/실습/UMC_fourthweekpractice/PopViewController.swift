//
//  PopViewController.swift
//  UMC_fourthweekpractice
//
//  Created by 신예진 on 2023/05/03.
//

import Foundation
import UIKit
import WebKit

class PopViewController: UIViewController, PopUpDelegate{
    
    
    @IBOutlet weak var myWebView: WKWebView!
    
    @IBOutlet weak var createPopUpBtn: UIButton!
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // 노티피케이션 이라는 방송 수신기를 장착한다.
//        NotificationCenter.default.addObserver(self, selector: #selector(loadWebView), name: NSNotification.Name(rawValue: notificationName), object: nil)


    }
    
    @objc fileprivate func loadWebView(){
        print("ViewController - loadWebView()")
        let myBlogAddress = URL(string: "https://velog.io/@yeahzxnn")
        self.myWebView.load(URLRequest(url: myBlogAddress!))
    }
    
    
    @IBAction func onCreatePopUpBtnClicked(_ sender: UIButton) {
        print("ViewController - onCreatePopUpBtnClicked() called")
        
        // 스토리보드 가져오기
        let storyboard = UIStoryboard.init(name: "PopUp", bundle: nil)
        // 스토리보드를 통해 뷰컨트롤러 가져오기
        let customPopUpVC = storyboard.instantiateViewController(withIdentifier: "AlertPopUpVC") as! CustomPopUpViewController
        // 뷰컨트롤러가 보여지는 스타일
        customPopUpVC.modalPresentationStyle = .overCurrentContext
        // 뷰컨트롤러가 사라지는 스타일
        customPopUpVC.modalTransitionStyle = .crossDissolve
        
        customPopUpVC.subscribeBtnCompletionClosure = {
            print("컴플레션 블럭이 호출되었다.")
            let myChannelUrl = URL(string: "https://recruit.navercorp.com/")
            self.myWebView.load(URLRequest(url: myChannelUrl!))
        }
        
        customPopUpVC.myPopUpDelegate = self
        
        self.present(customPopUpVC, animated: true, completion: nil)
        
    }
    
    //MARK: - PopUpDelegate methods
    func onOpenChatBtnClicked() {
        print("ViewController - onOpenChatBtnClicked() called")
        let myChannelUrl = URL(string: "https://careers.kakao.com/index")
        self.myWebView.load(URLRequest(url: myChannelUrl!))
    }
    

    
}
