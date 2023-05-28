//
//  NewAddController.swift
//  SeventhWeek-Mission1
//
//  Created by 정호진 on 2023/05/20.
//

import Foundation
import Hero
import UIKit

final class NewAddController: UIViewController{
    var delegate: SendInfo?
    private var infoList: [Info] = []
    private var checkValid: Bool = false
    @IBOutlet weak var pW: UITextField!
    @IBOutlet weak var iD: UITextField!
    
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var stackvie: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoList = load()
        self.iD.addTarget(self, action: #selector(textFieldDidchange), for: .editingChanged)
        
        self.isHeroEnabled = true
        self.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoomOut)
        stackvie.hero.id = "targetAnimation"
        
    }
    
    private func load() -> [Info]{
        guard let data = UserDefaults.standard.array(forKey: "userInfo") as? [Data] else {return []}
        return data.map { try! JSONDecoder().decode(Info.self, from: $0) }
    }
    
    @IBAction func clickedBack(_ sender: Any) {
        self.hero.dismissViewController()
    }
    
    @IBAction func clickedCreate(_ sender: Any) {
        
        guard let id = iD.text else {return}
        guard let password = pW.text else {return}
        
        if id != "" && password != ""{
            if checkValid {
                self.delegate?.sendInfo(id: id, pw: password)
                alertActionCode("가입되었습니다.", "확인", true)
            }
        }
        else{
            alertActionCode("잘못된 입력입니다.", "확인", false)
        }
    }
    
    private func alertActionCode(_ title: String, _ btn: String, _ check: Bool){
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: btn, style: .default){ _ in
            if check{
//                self.dismiss(animated: true)
                self.hero.dismissViewController()
            }
        }
        
        alert.addAction(ok)
        self.present(alert,animated: true)
    }
    
    private func addRightImg(img: UIImage) -> UIImageView{
        let imgview = UIImageView()
        imgview.image = img
        return imgview
    }
    
    @objc
    private func textFieldDidchange(){
        self.iD.rightView = addRightImg(img: UIImage(systemName: "xmark")!)
        self.iD.rightViewMode = .always
        
        let list = self.infoList.filter { $0.id == self.iD.text }
        if self.iD.text == ""{
            self.iD.rightView = nil
        }
        else if list.isEmpty{
            checkValid = true
            self.iD.rightView = addRightImg(img: UIImage(systemName: "checkmark")!)
        }
        
    }
    
}


protocol SendInfo{
    func sendInfo(id: String, pw: String)
}
