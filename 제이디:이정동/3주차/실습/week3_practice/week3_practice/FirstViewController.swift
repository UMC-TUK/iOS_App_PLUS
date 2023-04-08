//
//  ViewController.swift
//  week3_practice
//
//  Created by 이정동 on 2023/04/06.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hobbyTextField: UITextField!
    @IBOutlet weak var count: UILabel!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let cnt = count.text, let num = Int(cnt) else { return }
        count.text = "\(num + 1)"
    }
    

    @IBAction func buttonTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "SecondVC") as! SecondViewController
        
        vc.image = image
        vc.name = nameTextField.text
        vc.hobby = hobbyTextField.text
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func rpsTapped(_ sender: UIButton) {
        self.image = sender.currentImage
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            let vc = segue.destination as! SecondViewController
            
            vc.image = image
            vc.name = nameTextField.text
            vc.hobby = hobbyTextField.text
        }
    }
    
}

