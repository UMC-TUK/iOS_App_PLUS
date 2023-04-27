//
//  DetailViewController.swift
//  week4_practice
//
//  Created by 이정동 on 2023/04/27.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descript: UILabel!
    
    var logoImage: UIImage?
    var nameStr: String?
    var descriptStr: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logo.image = logoImage
        name.text = nameStr
        descript.text = descriptStr
    }
    
}
