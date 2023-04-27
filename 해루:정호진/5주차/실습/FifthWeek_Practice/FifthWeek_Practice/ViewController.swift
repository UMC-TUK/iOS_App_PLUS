//
//  ViewController.swift
//  FifthWeek_Practice
//
//  Created by 정호진 on 2023/04/25.
//

import UIKit
import Lottie

final class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    private var speed: Double = 0.5
    private var count = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addUI()
    }

    // MARK: Refresh UI
    private lazy var refreshUI: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshView(refreshControl: )), for: .valueChanged)
        return refresh
    }()
        
    
    private func addUI(){
        self.collectionView.addSubview(refreshUI)
        
    }
    
    @objc
    func refreshView(refreshControl: UIRefreshControl) {
        refreshControl.attributedTitle = NSAttributedString(string: "Speed UP!")
        self.count += 1
        collectionView.reloadData()
        refreshControl.endRefreshing()
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        speed = 0.5 * Double(indexPath.row + 1)
        cell.inputData(speed: speed)
        return cell
    }
    
    
    
    
    
}
