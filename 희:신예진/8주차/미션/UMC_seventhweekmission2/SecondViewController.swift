//
//  SecondViewController.swift
//  UMC_seventhweekmission2
//
//  Created by 신예진 on 2023/05/28.
//

import Foundation
import UIKit
import Gemini

class SecondViewController: UIViewController, UICollectionViewDataSource,
UICollectionViewDelegate {
    
    
    
    
    @IBOutlet weak var collectionView: GeminiCollectionView!
    

    let photos = ["1","2","3","4","5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.gemini
            .rollRotationAnimation()
            .degree(45)
            .rollEffect(.rollUp)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gemCell", for: indexPath) as! MyCell
        
        cell.setCell(imageName: photos[indexPath.row])
        
        self.collectionView.animateCell(cell)
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.collectionView.animateVisibleCells()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if let cell = cell as? MyCell{
            self.collectionView.animateCell(cell)
        }
        
    }
    
}
