//
//  TableViewCell.swift
//  FourthWeek_Mission
//
//  Created by 정호진 on 2023/05/06.
//

import Foundation
import UIKit

final class TableViewCell: UITableViewCell{
    @IBOutlet weak var collectionView: UICollectionView!
    private var data: List?
    
    func setCollectionView(){
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    func getData(list: List){
        self.data = list
    }
    
    
}

extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .yellow
        
        if let data = self.data{
            print(indexPath.row)
            cell.inputImg(color: data.colorList[indexPath.row])
        }
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.colorList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: self.collectionView.safeAreaLayoutGuide.layoutFrame.width/3,
                          height: self.collectionView.safeAreaLayoutGuide.layoutFrame.height)
        return size
    }
    
    
}
