//
//  ViewController.swift
//  UMC_fifthweekmission
//
//  Created by 신예진 on 2023/05/05.
//
import Foundation
import UIKit
import Lottie
import JGProgressHUD


class ViewController: UIViewController{
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var img:[String] = ["1","2","3","4","5","6","7","8","9","10"]
    var name:[String] = [
        "아멜리",
        "헬로키티",
        "슬리피슬립",
        "카시오",
        "럼튼",
        "프라이빗룩북",
        "밀크바오밥",
        "웨이스",
        "린콤마",
        "엘로이"
    ]
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initRefresh()
        DispatchQueue.main.asyncAfter (
        deadline: .now()+1, execute: {
            self.showExample()
        })
        
    }
    
    func showExample(){
        let hud = JGProgressHUD()
        hud.indicatorView = JGProgressHUDPieIndicatorView()
        hud.textLabel.text = "Loading"
        hud.detailTextLabel.text = "Please wait"
        //        hud.textLabel.textColor = .red
        //        hud.hudView.backgroundColor = .systemPink
        //        hud.cornerRadius = 50
        //        hud.detailTextLabel.text = "Please wait"
        hud.show(in: view)
        //        3초뒤에 이 문구 없어지고 뷰 나타나게 됨.
        hud.dismiss(afterDelay: 5)
        
        var progress: Float = 0.0
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){
            timer in
            progress += 0.1
            hud.setProgress(progress, animated: true)
            let value: Float = progress/1.0
            hud.detailTextLabel.text = "\(Int(value * 100.0))%"
            if progress > 1.0 {
                timer.invalidate()
            }
            //
            //            hud.indicatorView = JGProgressHUDSuccessIndicatorView()
            //            hud.detailTextLabel.text = nil
            //            hud.textLabel.text = "Done!"
            //            hud.dismiss(afterDelay: 3)
            //        }
            
        }
    }
    
    func initRefresh() {
            refreshControl.addTarget(self, action: #selector(refreshCollectionView(refresh:)), for: .valueChanged)
            
            refreshControl.backgroundColor = .black
            refreshControl.tintColor = .white
            refreshControl.attributedTitle = NSAttributedString(string: "더 많은 상품을 즐겨보세요!")
            
            collectionView.refreshControl = refreshControl
        }
    
    @objc func refreshCollectionView(refresh: UIRefreshControl) {
            print("새로고침 시작")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.collectionView.reloadData()
                refresh.endRefreshing()
            }
        }

    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return img.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.cornerRadius = 25
        
        cell.image.image = UIImage(named: img[indexPath.row])
        cell.name.text = name[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 20)/2
        return CGSize(width: size, height: size)
    }
    
      
}
