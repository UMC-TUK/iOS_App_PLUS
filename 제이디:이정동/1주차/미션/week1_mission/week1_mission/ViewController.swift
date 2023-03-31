//
//  ViewController.swift
//  week1_mission
//
//  Created by 이정동 on 2023/03/30.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    
    let flowLayout = UICollectionViewFlowLayout()
    let bottomFlowLayout = UICollectionViewFlowLayout()
    
    var images: [UIImage?] = [
        UIImage(named: "page1"),
        UIImage(named: "page2"),
        UIImage(named: "page3"),
        UIImage(named: "page4"),
        UIImage(named: "page5")
    ]
    
    var bottomImages: [UIImage?] = [
        UIImage(named: "product1"),
        UIImage(named: "product2"),
        UIImage(named: "product3")
    ]
    
    var timer: Timer?
    var currentCellIndex = 0
    
    var topCollectionViewDataSource: TopCollectionViewDataSource?
    var bottomCollectionViewDataSource: BottomCollectionViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageView.numberOfPages = images.count
        
        setupCollectionView()
        startTimer()
    }
    
    private func setupCollectionView() {
        // top
        collectionView.delegate = TopCollectionViewDelegate()
        topCollectionViewDataSource = TopCollectionViewDataSource(viewController: self)
        collectionView.dataSource = topCollectionViewDataSource
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        collectionView.collectionViewLayout = flowLayout
        
        // bottom
        bottomCollectionView.delegate = BottomCollectionViewDelegate()
        bottomCollectionViewDataSource = BottomCollectionViewDataSource(viewController: self)
        bottomCollectionView.dataSource = bottomCollectionViewDataSource
        
        bottomFlowLayout.scrollDirection = .horizontal
        bottomFlowLayout.itemSize = CGSize(width: bottomCollectionView.frame.height, height: bottomCollectionView.frame.height)
        bottomCollectionView.collectionViewLayout = bottomFlowLayout
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    
    @objc func moveToNextIndex() {
        
        currentCellIndex += 1
        
        if currentCellIndex == images.count { currentCellIndex = 0 }
        
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageView.currentPage = currentCellIndex
    }
    
}


class TopCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    let viewController: ViewController
    
    init(viewController: ViewController) {
        self.viewController = viewController
        super.init()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewController.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.imageView.image = viewController.images[indexPath.row]
        
        return cell
    }
    
    
}

class TopCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    
}

class BottomCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    let viewController: ViewController
    
    init(viewController: ViewController) {
        self.viewController = viewController
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewController.bottomImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomCollectionViewCell", for: indexPath) as! BottomCollectionViewCell
        cell.image.image = viewController.bottomImages[indexPath.row]
        
        if indexPath.item == viewController.bottomImages.count - 1 {
            cell.seperate.backgroundColor = .white
        }
        
        return cell
    }
    
    
}

class BottomCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    
}
