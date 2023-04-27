//
//  CollectionViewCell.swift
//  FifthWeek_Practice
//
//  Created by 정호진 on 2023/04/25.
//

import Foundation
import UIKit
import Lottie

final class CollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var animationView: LottieAnimationView!
    
    func inputData(speed: Double){
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = speed
        animationView.play()
    }
}
