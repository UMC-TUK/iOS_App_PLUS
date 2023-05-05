//
//  wait.swift
//  UMC_fifthweekmission
//
//  Created by 신예진 on 2023/05/06.
//


import UIKit
import JGProgressHUD

class wait: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter (
        deadline: .now()+1, execute: {
            self.showExample()
        })
    }
    
    func showExample(){
        let hud = JGProgressHUD()
        hud.indicatorView = JGProgressHUDImageIndicatorView(image: UIImage(systemName: "bell")!)
        hud.textLabel.text = "Notification Enabled"
//        hud.detailTextLabel.text = "0%"
//        hud.textLabel.textColor = .red
//        hud.hudView.backgroundColor = .systemPink
//        hud.cornerRadius = 50
//        hud.detailTextLabel.text = "Please wait"
        hud.show(in: view)
        //3초뒤에 이 문구 없어지고 뷰 나타나게 됨.
//        hud.dismiss(afterDelay: 3)
        
//        var progress: Float = 0.0
//        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){
//            timer in
//            progress += 0.1
//            hud.setProgress(progress, animated: true)
//            let value: Float = progress/1.0
//            hud.detailTextLabel.text = "\(Int(value * 100.0))%"
//            if progress > 1.0 {
//                timer.invalidate()
//            }
//
//            hud.indicatorView = JGProgressHUDSuccessIndicatorView()
//            hud.detailTextLabel.text = nil
//            hud.textLabel.text = "Done!"
//            hud.dismiss(afterDelay: 3)
//        }
        
    }

}

