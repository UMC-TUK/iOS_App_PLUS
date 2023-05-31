//
//  WeeklyChartViewController.swift
//  MovieApp
//
//  Created by 신예진 on 2023/01/19.
//

import Foundation
import UIKit
import Alamofire

class WeeklyChartViewController: UIViewController {

  // MARK: - Properties
  @IBOutlet weak var weeklyCollectionView: UICollectionView!
  var weeklyBoxOfficeList: [WeeklyBoxOfficeList] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    weeklyCollectionView.dataSource = self
    weeklyCollectionView.delegate = self
    getDailyMovie()
  }
  
  // MARK: - Methods
  private func getDailyMovie() {
    var url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=ce892e04c95cefd2f26f5dfdd9912c68&targetDt="
    url += getWeekString()
    print(url)
    AF.request(url).responseJSON { (response) in
      switch response.result {
      case.success(let data):
        do {
          let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
          let json = try JSONDecoder().decode(WeeklyChart.self, from: jsonData)
          self.weeklyBoxOfficeList = json.boxOfficeResult.weeklyBoxOfficeList
         
          // collectionView reloadData
          DispatchQueue.main.async {
            self.weeklyCollectionView.reloadData()
          }
        } catch(let error) {
          print("getDailyMovie \(error.localizedDescription)")
        }
      case .failure(let error):
        print("failure getDailyMovie \(error.localizedDescription)")
      }
    }
  }
  
  private func getDetailMovie(movieCd: String) {
    let url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=ce892e04c95cefd2f26f5dfdd9912c68&movieCd=\(movieCd)"
      
   
    AF.request(url).responseJSON { (response) in
      switch response.result {
      case.success(let data):
        do {
          let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
          let json = try JSONDecoder().decode(DetailMovie.self, from: jsonData)
          let movieInfo = json.movieInfoResult.movieInfo
         
          // DetailMovieViewController 데이터 전달
          guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailMovieVC")
                  as? DetailMovieViewController else { return }
          vc.movieInfo = movieInfo
          vc.modalPresentationStyle = .fullScreen
          self.present(vc, animated: true, completion: nil)
          
        } catch(let error) {
          print(error.localizedDescription)
        }
      case .failure(let error):
        print("failure \(error.localizedDescription)")
      }
    }
  }
  
  private func getWeekString() -> String {
    guard let yesterDay = Calendar.current.date(byAdding: .day, value: -7, to: Date()) else { return "" }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYYMMdd"
    let str = dateFormatter.string(from: yesterDay)
    return str
  }
}

// MARK: - UICollectionViewDataSource
extension WeeklyChartViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return weeklyBoxOfficeList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = weeklyCollectionView.dequeueReusableCell(withReuseIdentifier: "weeklyChartCell", for: indexPath)
            as? WeeklyChartCollectionViewCell else { return UICollectionViewCell() }
    cell.audiAccLabel.text = "누적 \(weeklyBoxOfficeList[indexPath.row].audiAcc)명"
    cell.titleLabel.text = weeklyBoxOfficeList[indexPath.row].movieNm
    cell.rankLabel.text = weeklyBoxOfficeList[indexPath.row].rank
    cell.salesLabel.text = "\(weeklyBoxOfficeList[indexPath.row].salesShare)%"
    cell.posterImageView.layer.cornerRadius = 10
    if let image = UIImage(named: weeklyBoxOfficeList[indexPath.row].movieCd) {
      cell.posterImageView.image = image
    }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let movieCd = weeklyBoxOfficeList[indexPath.row].movieCd
    getDetailMovie(movieCd: movieCd)
  }
  
  
}
