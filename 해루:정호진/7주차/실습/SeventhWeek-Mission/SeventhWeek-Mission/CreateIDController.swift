//
//  CreateIDController.swift
//  SeventhWeek-Mission
//
//  Created by 정호진 on 2023/05/16.
//

import Foundation
import UIKit

final class CreateIDController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addUI()
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "회원가입"
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var IdLabel: UILabel = {
        let label = UILabel()
        label.text = "아이디"
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var idTextField: UITextField = {
       let field = UITextField()
        field.borderStyle = .roundedRect
        field.placeholder = "새로운 아이디를 입력하세요"
        field.translatesAutoresizingMaskIntoConstraints = false
        field.textAlignment = .right
        return field
    }()
    
    private lazy var IdStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [IdLabel,idTextField])
        stack.distribution = .fill
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var passWordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
       let field = UITextField()
        field.placeholder = "새로운 비밀번호를 입력하세요"
        field.borderStyle = .roundedRect
        field.translatesAutoresizingMaskIntoConstraints = false
        field.textAlignment = .right
        return field
    }()
    
    private lazy var passwordStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [passWordLabel, passwordTextField])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [IdStack, passwordStack])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var createBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("회원가입", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(clickedLogin), for: .touchUpInside)
        return btn
    }()
    
    private func addUI(){
        self.view.addSubview(verticalStack)
        self.view.addSubview(createBtn)
        setAutoLayout()
    }
    
    private func setAutoLayout(){
        NSLayoutConstraint.activate([
            self.verticalStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.verticalStack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor,constant: -30),
            
            self.IdLabel.widthAnchor.constraint(equalToConstant: 100),
            self.passWordLabel.widthAnchor.constraint(equalToConstant: 100),
            
            self.createBtn.topAnchor.constraint(equalTo: verticalStack.bottomAnchor,constant: 30),
            self.createBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
    }
    
    @objc
    private func clickedLogin(){
        guard let id = idTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        if id != "" && password != ""{
            print(id)
            print(password)
            UserDefaults.standard.setValue(id, forKey: password)
            self.dismiss(animated: true)
        }
        else{
            let alert = UIAlertController(title: "잘못된 입력입니다.", message: nil, preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
            
            alert.addAction(ok)
            self.present(alert,animated: true)
        }
        
    }
}
