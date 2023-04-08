//
//  SecondViewController.swift
//  week3_practice
//
//  Created by 이정동 on 2023/04/06.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var previewVC: FirstViewController?
    
    var name: String?
    var hobby: String?
    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupLabel()
        
    }
    
    func setupLabel() {
        
        if let image = image {
            imageView.image = image
        } else {
            imageView.image = UIImage(systemName: "person")
        }
        guard let name = name, let hobby = hobby else { return }
        
        label.text = "이름은 \(name), 취미는 \(hobby)."
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        previewVC?.increaseCount()
    }

}
