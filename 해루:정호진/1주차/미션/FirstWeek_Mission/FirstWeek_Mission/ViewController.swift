//
//  ViewController.swift
//  FirstWeek_Mission
//
//  Created by 정호진 on 2023/03/30.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var bigSaleCollectionView: UICollectionView!
    
    let bannerImgList: [UIImage] = [UIImage(named: "coupangPlay")!,
                                    UIImage(named: "rocketDirectly")!,
                                    UIImage(named: "rocketFresh")!,
                                    UIImage(named: "fashion")!,
                                    UIImage(named: "coupangEats")!,
                                    UIImage(named: "rocketDeliver")!,
                                    UIImage(named: "goldbox")!,
                                    UIImage(named: "c")!,
                                    UIImage(named: "timeSale")!,
                                    UIImage(named: "coupangLive")!,
                                    UIImage(named: "biz")!,
                                    UIImage(named: "install")!,
                                    UIImage(named: "return")!,
                                    UIImage(named: "digital")!,
                                    UIImage(named: "beauty")!,
                                    UIImage(named: "mySale")!,
                                    UIImage(named: "gift")!,
                                    UIImage(named: "trip")!,
                                    UIImage(named: "mobile")!,
                                    UIImage(named: "eat")!]
    
    let bigSaleList: [UIImage] = [UIImage(named: "saleItem1")!,
                                  UIImage(named: "saleItem2")!,
                                  UIImage(named: "saleItem3")!,
                                  UIImage(named: "saleItem1")!,]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == bannerCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath) as! BannerCollectionViewCell
            cell.renderingImg(img: self.bannerImgList[indexPath.item])
            return cell
        }
        else if collectionView == bigSaleCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigSaleCell", for: indexPath) as! BigSaleCollectionViewCell
            cell.renderingImg(img: self.bigSaleList[indexPath.item])
            return cell
        }
        else{
            return UICollectionViewCell()
        }
    }
    
    // MARK: cell 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == bannerCollectionView{
            let width: CGFloat = (collectionView.frame.width / 5) - 1
            let height: CGFloat = (collectionView.frame.height / 2) - 3
            return CGSize(width: width, height: height)
        }
        else if collectionView == bigSaleCollectionView{
            let width: CGFloat = (collectionView.frame.width / 3) - 1
            let height: CGFloat = (collectionView.frame.height)
            return CGSize(width: width, height: height)
        }
        return CGSize(width: 0, height: 0)
    }
    
    
    // CollectionView Cell의 위아래 간격
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       if collectionView == bannerCollectionView{
           return 3.0
       }
       return 0
   }
   
   // CollectionView Cell의 옆 간격
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
       return 3.0
   }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bannerCollectionView{
            return bannerImgList.count
        }
        else if collectionView == bigSaleCollectionView{
            return bigSaleList.count
        }
        else{ return 0}
    }
}

