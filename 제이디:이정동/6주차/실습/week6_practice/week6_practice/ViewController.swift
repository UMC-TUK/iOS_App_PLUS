//
//  ViewController.swift
//  week6_practice
//
//  Created by 이정동 on 2023/05/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet var imgViews: [UIImageView]!
    @IBOutlet var imgLabels: [UILabel]!
    
    var count = 0
    var sequenceNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        refreshImage()
    }
    
    func refreshImage() {
        
        (0..<imgViews.count).forEach { index in
            imgViews[index].image = UIImage(named: "noImage")
            imgLabels[index].text = "대기 중"
            imgLabels[index].textColor = .black
        }
        
        (0..<imgViews.count).forEach { index in
            loadDataAfterFewSeconds(index, seconds: Int.random(in: 2...5))
        }
    }
    
    func loadDataAfterFewSeconds(_ index: Int, seconds: Int) {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(seconds)) {
            self.ApplyingData(index)
        }
    }
    
    func ApplyingData(_ index: Int) {
        DispatchQueue.main.async {
            self.imgViews[index].image = UIImage(named: "logo")
            self.imgLabels[index].text = "\(self.sequenceNumber)번 째"
            self.imgLabels[index].textColor = .red
            self.sequenceNumber += 1
        }
    }

    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        sequenceNumber = 1
        count += 1
        countLabel.text = "\(count)"
        refreshImage()
    }
}

