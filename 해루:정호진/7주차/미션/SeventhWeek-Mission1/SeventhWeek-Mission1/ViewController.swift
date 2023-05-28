//
//  ViewController.swift
//  SeventhWeek-Mission1
//
//  Created by 정호진 on 2023/05/19.
//

import UIKit
import Hero

final class ViewController: UIViewController {
    private var infoList: [Info] = []
    @IBOutlet weak var PW: UITextField!
    @IBOutlet weak var ID: UITextField!
    @IBOutlet weak var create: UIButton!
    @IBOutlet weak var login: UIButton!
    private var checkAuto: Bool = false
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoList = load()
//        for (key,value) in UserDefaults.standard.dictionaryRepresentation(){
//            print("\(key): \(value)")
//            UserDefaults.standard.removeObject(forKey: key)
//        }
        
        settingAutoLayout()
    }
    
    private func settingAutoLayout(){
        stackView.isHeroEnabled = true
        stackView.hero.id = "targetAnimation"
    }
    
    @IBAction func clickedLogin(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "DoneLoginController") else { return }
        
        let list = infoList.filter{self.ID.text == $0.id && self.PW.text == $0.pw}
        
        if !list.isEmpty{
            if !checkAuto{
                saveMyInfo(data: list[0])
            }
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController,animated: true)
        }
        else{
            alertActionCode("ID 또는 PW가 잘못되었습니다.","확인")
        }
    }
    
    @IBAction func clickedCretae(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "NewAddController") as? NewAddController else { return }
        viewController.delegate = self
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController,animated: true)
    }
    
    @IBAction func clickedCheckAuto(_ sender: UIButton) {
        if checkAuto {
            sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            checkAuto = false
        }
        else{
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            checkAuto = true
        }
    }
    
    private func saveData(){
        let data = self.infoList.map { try? JSONEncoder().encode($0)}
        UserDefaults.standard.set(data, forKey: "userInfo")
    }
    
    private func load() -> [Info]{
        guard let data = UserDefaults.standard.array(forKey: "userInfo") as? [Data] else {return []}
        return data.map { try! JSONDecoder().decode(Info.self, from: $0) }
    }
    
    private func saveMyInfo(data: Info){
        print("my: \(data)")
        let data = try? JSONEncoder().encode(data)
        UserDefaults.standard.set(data, forKey: "myData")
    }
    
    private func alertActionCode(_ title: String, _ btn: String){
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: btn, style: .default)
        
        alert.addAction(ok)
        self.present(alert,animated: true)
    }
    
}

extension ViewController: SendInfo{
    func sendInfo(id: String, pw: String) {
        self.infoList.append(Info(id: id, pw: pw))
        saveData()
    }
}


struct Info : Codable{
    let id: String
    let pw: String
}
