//
//  ThirdTabViewController.swift
//  MovieApp
//
//  Created by 신예진 on 2023/01/19.
//

import Foundation
import UIKit
import Alamofire

class ThirdTabViewController: UIViewController {

  // MARK: - Properties
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var searchTableView: UITableView!
  var searchList: [MovieList] = []
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    searchTableView.dataSource = self
    searchTableView.delegate = self
    searchBar.delegate = self
    
  }
  
  // MARK: - Methods
  private func getDailyMovie(searchResult: String) {
    
    // 한글 인코딩
    let urlString = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=ce892e04c95cefd2f26f5dfdd9912c68&movieNm=\(searchResult)"
    guard let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
    guard let url = URL(string: encodedString) else { return }

    AF.request(url).responseJSON { (response) in
      switch response.result {
      case.success(let data):
        do {
          let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
          let json = try JSONDecoder().decode(SearchMovie.self, from: jsonData)
          self.searchList = json.movieListResult.movieList
         
          // collectionView reloadData
          DispatchQueue.main.async {
            self.searchTableView.reloadData()
          }
        } catch(let error) {
          print(error.localizedDescription)
        }
      case .failure(let error):
        print("failure \(error.localizedDescription)")
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
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ThirdTabViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return searchList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = searchTableView.dequeueReusableCell(withIdentifier: "searchCell")
            as? SearchTableViewCell else { return UITableViewCell() }
    cell.genreLabel.text = searchList[indexPath.row].genreAlt
    cell.yearLabel.text = searchList[indexPath.row].prdtYear + "년"
    cell.titleLabel.text = searchList[indexPath.row].movieNm
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let movieCd = searchList[indexPath.row].movieCd
    getDetailMovie(movieCd: movieCd)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }
}

// MARK: - UISearchBarDelegate
extension ThirdTabViewController: UISearchBarDelegate {
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    searchBar.showsCancelButton = true
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.showsCancelButton = false
    searchBar.text = ""
    searchBar.resignFirstResponder()
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    if let text = searchBar.text {
      searchBar.showsCancelButton = false
      searchBar.resignFirstResponder()
      getDailyMovie(searchResult: text)
    }
    
  }
}
