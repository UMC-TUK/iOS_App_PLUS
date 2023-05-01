//
//  ViewController.swift
//  test
//
//  Created by 우주대스타 on 2023-05-01.
//

import UIKit

enum Calculation: String {
    case add = "+"
    case sub = "-"
    case mul = "*"
    case div = "/"
}

class ViewController: UIViewController {

    
    @IBOutlet weak var first: UITextField!
    @IBOutlet weak var second: UITextField!
    
    var result:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        first.text = nil
        second.text = nil
    }

    @IBAction func addButton(_ sender: Any) {
        presentSecondViewController(type: .add)
    }
    

    @IBAction func subButton(_ sender: Any) {
        presentSecondViewController(type: .sub)
    }
    
    @IBAction func mulButton(_ sender: Any) {
        presentSecondViewController(type: .mul)
    }
    
    
    @IBAction func divButton(_ sender: Any) {
        presentSecondViewController(type: .div)
    }
    
    func presentSecondViewController(type: Calculation) {
        result = calculate(type: type)
        }
    
    func calculate(type: Calculation) -> String {
            guard let firstText = first.text else {
                return "입력 오류"
            }
            guard let secondText = second.text else {
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
                    return "분모 0 오류"
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
          if segue.destination is SecondViewController {
              guard let vc = segue.destination as? SecondViewController else { return }
              vc.data = result
          }
      }
}

