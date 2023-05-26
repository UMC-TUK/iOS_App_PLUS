//
//  ViewController.swift
//  Week08_Practice
//
//  Created by 우주대스타 on 2023-05-27.
//

import UIKit

enum Calculation: String {
    case add = "+"
    case sub = "-"
    case mul = "*"
    case div = "/"
}

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!

    var result:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageView))
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        firstTextField.text = ""
        secondTextField.text = ""
    }
    
    @objc func didTapImageView() {
        UIView.animate(withDuration: 0.25) {
            let scale = CGAffineTransform(scaleX: 0.9, y: 0.9)
            self.imageView.transform = scale
        } completion: { finished in
            UIView.animate(withDuration: 0.25) {
                self.imageView.transform = .identity
            }
        }
    }

    @IBAction func addButton(_ sender: Any) {
        presentResultViewController(type: .add)
    }
    
    @IBAction func subButton(_ sender: Any) {
        presentResultViewController(type: .sub)
    }
    
    @IBAction func mulButton(_ sender: Any) {
        presentResultViewController(type: .mul)
    }
    
    @IBAction func divButton(_ sender: Any) {
        presentResultViewController(type: .div)
    }
    
    func presentResultViewController(type: Calculation){
        result = calculate(type: type)
    }
    
    func calculate(type: Calculation) -> String {
        guard let firstText = firstTextField.text else {
            return "입력 오류"
        }
        guard let secondText = secondTextField.text else {
            return "입력 오류"
        }
        
        guard let firstNumber = Double(firstText) else {
            return "입력 오류"
        }
        guard let secondNumber = Double(secondText) else {
            return "입력 오류"
        }
        
        var result: Double = 0
        
        switch type {
        case .add:
            result = firstNumber + secondNumber
        case .sub:
            result = firstNumber - secondNumber
        case .mul:
            result = firstNumber * secondNumber
        case .div:
            if secondNumber == 0 {
                return "0으로는 나눌 수 없어요!"
            } else {
                result = firstNumber / secondNumber
            }
        }
        
        return "\(firstNumber) \(type.rawValue) \(secondNumber) = \(result)"
    }
    @IBAction func sendData(_ sender: Any) {
        performSegue(withIdentifier: "sentData", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.destination is ResultViewController {
              guard let vc = segue.destination as? ResultViewController else { return }
              vc.result = result
          }
      }
    
}

