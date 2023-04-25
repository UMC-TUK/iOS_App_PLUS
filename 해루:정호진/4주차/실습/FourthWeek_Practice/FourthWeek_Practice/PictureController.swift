//
//  Picture.swift
//  FourthWeek_Practice
//
//  Created by 정호진 on 2023/04/24.
//

import Foundation
import UIKit

final class PictureController: UIViewController{
    private let list: [DataModel] = [DataModel(image: UIImage(named: "1")!, title: "1"),
                                        DataModel(image: UIImage(named: "2")!, title: "2"),
                                        DataModel(image: UIImage(named: "3")!, title: "3"),
                                        DataModel(image: UIImage(named: "4")!, title: "4"),
                                        DataModel(image: UIImage(named: "5")!, title: "5"),
                                        DataModel(image: UIImage(named: "6")!, title: "6"),
                                        DataModel(image: UIImage(named: "7")!, title: "7"),
                                        DataModel(image: UIImage(named: "8")!, title: "8"),
                                        DataModel(image: UIImage(named: "9")!, title: "9"),]
    var delegate: SendImg?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
}

extension PictureController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.inputImg(img: list[indexPath.row].image.resize(newWidth: collectionView.bounds.width/4))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.sendImg(data: list[indexPath.row])
        
        self.dismiss(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return list.count }
}


extension UIImage {
    func resize(newWidth: CGFloat) -> UIImage {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale

        let size = CGSize(width: newWidth, height: newHeight)
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { context in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        return renderImage
    }
}

protocol SendImg{
    func sendImg(data: DataModel)
}

struct DataModel{
    let image: UIImage
    let title: String
}
