//
//  DetailMovieViewController.swift
//  MovieApp
//
//  Created by 신예진 on 2023/01/19.
//

import Foundation
import UIKit

class DetailMovieViewController: UIViewController {

  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var titleEgLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var showTimeLabel: UILabel!
  @IBOutlet weak var genreLabel: UILabel!
  @IBOutlet weak var actorLabel: UILabel!
  @IBOutlet weak var directorLabel: UILabel!
  @IBOutlet weak var uiview1: UIView!
  @IBOutlet weak var uiview2: UIView!
  @IBOutlet weak var uiview3: UIView!
  
  var movieInfo: MovieInfo?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
  }

  func setUI() {
    uiview1.layer.cornerRadius = 10
    uiview2.layer.cornerRadius = 10
    uiview3.layer.cornerRadius = 10
    
    if let movieInfo = movieInfo {
      if let image = UIImage(named: movieInfo.movieCd) {
        posterImageView.image = image
      } else {
        posterImageView.image = UIImage(named: "noImage")
      }
      titleLabel.text = movieInfo.movieNm
      titleEgLabel.text = movieInfo.movieNmEn
      dateLabel.text = movieInfo.openDt
      showTimeLabel.text = movieInfo.showTm+"분"
      genreLabel.text = movieInfo.genres[0].genreNm
      actorLabel.text = movieInfo.actors?[0].peopleNm
      directorLabel.text = movieInfo.directors[0].peopleNm
    }
  }
  @IBAction func cancelTouched(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
}
