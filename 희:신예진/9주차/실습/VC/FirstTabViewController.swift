//
//  FirstTabViewController.swift
//  MovieApp
//
//  Created by 신예진 on 2023/01/19.
//

import Foundation
import UIKit
import KakaoSDKUser

class FirstTabViewController: UIViewController {

  // MARK:- Properties
  @IBOutlet weak var adCollectionView: UICollectionView!
  @IBOutlet weak var nicknameLabel: UILabel!
  @IBOutlet weak var profileImageView: UIImageView!
  let adImageViewNames: [String] = ["ad1", "ad2","ad3","ad4"]
    
  // MARK: LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    adCollectionView.dataSource = self
    adCollectionView.delegate = self
    
//
//    for view in views {
//      view.layer.cornerRadius = 30
//    }
//    profileImageView.layer.cornerRadius = profileImageView.frame.height/2
    profileImageView.layer.borderWidth = 1
    profileImageView.layer.borderColor = UIColor.systemGray4.cgColor
    setUserInfo()
  }
  
  // MARK: - 프로필가져오기
  func setUserInfo() {
    UserApi.shared.me() { (user, error) in
      if let error = error {
        print(error)
      } else {
        print("me() success")
        _ = user
        self.nicknameLabel.text = user?.kakaoAccount?.profile?.nickname
        if let imageUrl = user?.kakaoAccount?.profile?.profileImageUrl,
        let data = try? Data(contentsOf: imageUrl) {
          self.profileImageView.image = UIImage(data: data)
        }
      }
    }
  }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension FirstTabViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == adCollectionView {
      guard let cell = adCollectionView.dequeueReusableCell(withReuseIdentifier: "adCell", for: indexPath)
              as? ADCollectionViewCell else { return UICollectionViewCell() }
      cell.imgView.image = UIImage(named: adImageViewNames[indexPath.row])
      return cell
    }
    return UICollectionViewCell()
  }
    
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
  }
    
}
