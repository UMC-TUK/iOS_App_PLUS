//
//  ResultViewController.swift
//  Week08_Practice
//
//  Created by 우주대스타 on 2023-05-27.
//

import UIKit

class ResultViewController: UIViewController {
    
    var result: String?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let result = result {
            resultLabel.text = result
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateImageView()
    }
    
    func animateImageView(){
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.3, options: .repeat) {
            let translation = CGAffineTransform(translationX: 0, y: 10)
            self.imageView.transform = translation
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

          
          // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
