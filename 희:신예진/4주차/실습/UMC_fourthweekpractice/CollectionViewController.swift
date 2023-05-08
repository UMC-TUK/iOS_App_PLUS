//
//  CollectionViewController.swift
//  UMC_fourthweekpractice
//
//  Created by 신예진 on 2023/05/03.
//

import UIKit

class CollectionViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var colors: [UIColor] = [
        .systemCyan,
        .systemGreen,
        .systemBlue,
        .systemRed,
        .systemOrange,
        .systemBrown,
        .systemYellow,
        .systemPurple,
        .systemPink,
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longPressGesture = UILongPressGestureRecognizer(
            target: self,
            action: #selector(handleLongPressGesture)
        )
        collectionView.addGestureRecognizer(longPressGesture)
    }
    
    @objc private func handleLongPressGesture(_ gesture: UILongPressGestureRecognizer){
        let getsureLocation = gesture.location(in: collectionView)
        switch gesture.state{
        case .began:
            guard let targetIndexPath = collectionView.indexPathForItem(at: getsureLocation)else{
                return
            }
            collectionView.beginInteractiveMovementForItem(at: targetIndexPath)
            
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(getsureLocation)
            
        case .ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
            
        }
        
    }
    
    
}

extension CollectionViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/3.2, height: collectionView.frame.width/3.2)
    }
}

extension CollectionViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = colors.remove(at: sourceIndexPath.row)
        colors.insert(item, at: destinationIndexPath.row)
    }
    
}
