//
//  ViewController.swift
//  week2_mission
//
//  Created by 이정동 on 2023/04/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let flowLayout = UICollectionViewFlowLayout()
    
    let month: [UIImage?] = [
        UIImage(named: "jan"),
        UIImage(named: "feb"),
        UIImage(named: "mar"),
        UIImage(named: "april"),
        UIImage(named: "may"),
        UIImage(named: "jun"),
        UIImage(named: "jul"),
        UIImage(named: "aug"),
        UIImage(named: "sep"),
        UIImage(named: "oct"),
        UIImage(named: "nov"),
        UIImage(named: "dec")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupCollectionView()
    }


    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        flowLayout.scrollDirection = .horizontal
        
        flowLayout.itemSize = CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
        flowLayout.minimumInteritemSpacing = 1
        
        collectionView.collectionViewLayout = flowLayout
    }
    
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return month.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCollectionViewCell", for: indexPath) as! CalendarCollectionViewCell
        
        cell.image.image = month[indexPath.item]
        
        return cell
    }
    
    
}
