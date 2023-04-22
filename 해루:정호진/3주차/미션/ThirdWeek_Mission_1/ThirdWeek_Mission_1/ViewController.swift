//
//  ViewController.swift
//  ThirdWeek_Mission_1
//
//  Created by 정호진 on 2023/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var AC: UIButton!
    @IBOutlet weak var plus_Minus: UIButton!
    @IBOutlet weak var percentage: UIButton!
    @IBOutlet weak var divide: UIButton!
    @IBOutlet weak var multiply: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var equal: UIButton!
    @IBOutlet weak var dot: UIButton!
    @IBOutlet var numbers: [UIButton]!
    @IBOutlet weak var textField: UITextField!
    
    private var total: Double = 0           /// 수식 계산 값
    private var symbol: String = ""         /// 수식 기호 저장하는 변수
    private var nextNum: Double = 0         /// 수식 기호 누르고 입력하는 숫자
    private var checkInput: Bool = false    /// 수식 버튼 바꾸는 경우 확인하는 변수

    override func viewDidLoad() {
        super.viewDidLoad()
        setRadius()
        numberBtn()
    }

    // MARK: 동글동글하게 만드는 함수
    func setRadius(){
        AC.layer.cornerRadius = AC.bounds.height/2
        AC.clipsToBounds = true
        
        plus_Minus.layer.cornerRadius = plus_Minus.bounds.height/2
        plus_Minus.clipsToBounds = true
        
        percentage.layer.cornerRadius = percentage.bounds.height/2
        percentage.clipsToBounds = true
        
        divide.layer.cornerRadius = divide.bounds.height/2
        divide.clipsToBounds = true
        
        multiply.layer.cornerRadius = multiply.bounds.height/2
        multiply.clipsToBounds = true
        
        plus.layer.cornerRadius = plus.bounds.height/2
        plus.clipsToBounds = true
        
        minus.layer.cornerRadius = minus.bounds.height/2
        minus.clipsToBounds = true
        
        equal.layer.cornerRadius = equal.bounds.height/2
        equal.clipsToBounds = true
        
        dot.layer.cornerRadius = dot.bounds.height/2
        dot.clipsToBounds = true
        
        numbers.forEach { btn in
            btn.layer.cornerRadius = btn.bounds.height/2
            btn.clipsToBounds = true
        }
        
    }

    func setACButtonAttribute(text: String) -> NSAttributedString{
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 30),
            .foregroundColor: UIColor.black
        ]
        let attributedTitle = NSAttributedString(string: text, attributes: attributes)
        
        return attributedTitle
    }
    
    // MARK: 숫자 버튼들 눌렀을 때
    func numberBtn(){
        numbers.forEach { btn in
            btn.addTarget(self, action: #selector(clickNumberBtn), for: .touchUpInside)
        }
    }
    
    // MARK: 숫자 버튼들 눌렀을 때 실행
    @objc
    func clickNumberBtn(_ sender: UIButton){
        numbers.forEach { btn in
            if btn == sender{
                if textField.text! == "0" { textField.text! = "" }
                if !self.symbol.isEmpty{ textField.text = "" }
                checkInput = true
                textField.text! += btn.titleLabel?.text ?? ""
                AC.setAttributedTitle(setACButtonAttribute(text: "C"), for: .normal)
            }
        }
    }
    
    // MARK: Clicked AC & C Button
    @IBAction func clickedAC(_ sender: Any) {
        if AC.titleLabel?.text == "AC"{
            self.total = 0
            self.nextNum = 0
            self.symbol = ""
        }
        else if AC.titleLabel?.text == "C"{
            AC.setAttributedTitle(setACButtonAttribute(text: "AC"), for: .normal)
            self.nextNum = 0
            self.symbol = ""
        }
        textField.text = "0"
    }
    
    // MARK: Clicked Plus Minus Button
    @IBAction func clickedPlusMinus(_ sender: Any) {
        var num = Double(textField.text ?? "0")!
        if num < 0{
            num = abs(num)
        }
        else if num > 0{
            num = 0 - num
        }
        textField.text = String(num)
    }
    
    // MARK: Clicked Percentage Button
    @IBAction func clickedPercentage(_ sender: Any) {
        textField.text = String( Double(textField.text ?? "0")! * 0.01)
    }
    
    // MARK: Clicked Divide Button
    @IBAction func clickedDivide(_ sender: Any) {
        nextNum = Double(textField.text ?? "")!
        
        if symbol.isEmpty{
            textField.text = String(nextNum)
        }
        else if nextNum != 0 && checkInput{
            calculateBefore()
        }
        checkInput = false
        self.symbol = "/"
        total = Double(textField.text ?? "")!
        nextNum = 0
    }
    
    // MARK: Clicked Multiply Button
    @IBAction func clickedMultiply(_ sender: Any) {
        nextNum = Double(textField.text ?? "")!
        if symbol.isEmpty {total = 1}
        
        if symbol.isEmpty{
            textField.text = String(nextNum)
        }
        else if nextNum != 0 && checkInput{
            calculateBefore()
        }
        checkInput = false
        self.symbol = "*"
        total = Double(textField.text ?? "")!
        nextNum = 0
    }
    
    // MARK: Clicked Minus Button
    @IBAction func clickedMinus(_ sender: Any) {
        nextNum = Double(textField.text ?? "")!
        
        if symbol.isEmpty{
            textField.text = String(nextNum)
        }
        else if nextNum != 0 && checkInput{
            calculateBefore()
        }
        checkInput = false
        self.symbol = "-"
        total = Double(textField.text ?? "")!
        nextNum = 0
    }
    
    // MARK: Clicked Plus Button
    @IBAction func clickedPlus(_ sender: Any) {
        nextNum = Double(textField.text ?? "")!
        
        if symbol.isEmpty{
            textField.text = String(nextNum)
        }
        else if nextNum != 0 && checkInput{
            calculateBefore()
        }
        
        checkInput = false
        self.symbol = "+"
        total = Double(textField.text ?? "")!
        nextNum = 0
    }
    
    // MARK: Clicked Dot Button
    @IBAction func clickedDot(_ sender: Any) { }
    
    // MARK: Clicked Equal Button
    @IBAction func clickedEqual(_ sender: Any) {
        nextNum = Double(textField.text ?? "")!
        
        if symbol.isEmpty{
            textField.text = String(nextNum)
        }
        else if nextNum != 0 && checkInput{
            calculateBefore()
        }
        
        checkInput = false
        total = Double(textField.text ?? "")!
        nextNum = 0
    }
    
    // MARK: 계산 하는 함수
    private func calculateBefore(){
        switch symbol{
        case "+":
            textField.text = String(total + nextNum)
        case "-":
            textField.text = String(total - nextNum)
        case "*":
            textField.text = String(total * nextNum)
        case "/":
            textField.text = String(total / nextNum)
        default:
            print("none")
        }
    }
    
}

