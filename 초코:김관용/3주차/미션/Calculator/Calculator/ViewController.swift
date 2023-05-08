//
//  ViewController.swift
//  Calculator
//
//  Created by gildong hong on 2023/05/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var num1: UITextField!
    @IBOutlet weak var num2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Sum(_ sender: Any) {
        guard let nextViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        
        guard let firstNumber = num1.text else { return }
        guard let secondNumber = num2.text else { return }
        
        let result = Int(firstNumber)! + Int(secondNumber)!
        nextViewController.resultString = String(result)
        present(nextViewController, animated: true)
    }
    
    @IBAction func Minus(_ sender: Any) {
        guard let nextViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        
        guard let firstNumber = num1.text else { return }
        guard let secondNumber = num2.text else { return }
        
        let result = Int(firstNumber)! - Int(secondNumber)!
        nextViewController.resultString = String(result)
        present(nextViewController, animated: true)
    }
    
    @IBAction func Divide(_ sender: Any) {
        guard let nextViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        
        guard let firstNumber = num1.text else { return }
        guard let secondNumber = num2.text else { return }
        
        let result = Double(firstNumber)! / Double(secondNumber)!
        nextViewController.resultString = String(result)
        present(nextViewController, animated: true)
    }
    
    @IBAction func Multiply(_ sender: Any) {
        guard let nextViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        
        guard let firstNumber = num1.text else { return }
        guard let secondNumber = num2.text else { return }
        
        let result = Int(firstNumber)! * Int(secondNumber)!
        nextViewController.resultString = String(result)
        present(nextViewController, animated: true)
    }
    
}

