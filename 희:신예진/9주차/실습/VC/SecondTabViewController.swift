//
//  SecondTabViewController.swift
//  MovieApp
//
//  Created by 신예진 on 2023/01/21.
//

import Foundation
import UIKit
import NMapsMap
import Alamofire
import CoreLocation

class SecondTabViewController: UIViewController {

  // MARK: - Properties
  @IBOutlet weak var mapView: NMFMapView!
  var locationManager = CLLocationManager()
  var checkMove = false
  var movieTheaters: [Row] = []
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    getMovieTheater()
    
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
      
    DispatchQueue.global().async {
        if CLLocationManager.locationServicesEnabled() {
          print("위치 서비스 on")
            self.locationManager.startUpdatingLocation()
        } else {
          print("위치 서비스 off")
        }
      }
  }

  // MARK: - 마커 설정Methods
  func setMarker(lat: Double, lng: Double, name: String) {
    let marker = NMFMarker()
    marker.iconImage = NMF_MARKER_IMAGE_BLACK
    marker.position = NMGLatLng(lat: lat, lng: lng)
    marker.width = 30
    marker.height = 40
    marker.mapView = mapView
    let infoWindow = NMFInfoWindow()
    let dataSource = NMFInfoWindowDefaultTextSource.data()
    dataSource.title = name
    infoWindow.dataSource = dataSource
    infoWindow.open(with: marker)
  }
  
  func setMovieTheaterMarker() {
    for movieTheater in movieTheaters {
      if let lat = movieTheater.refineWgs84Lat{
        if let lng = movieTheater.refineWgs84Logt {
          if let name = movieTheater.bizplcNm {
            setMarker(lat: Double(lat) ?? 0, lng: Double(lng) ?? 0, name: name)
          }
        }
      }
    }
  }
  
  //영화관 장소 받아오기
  func getMovieTheater() {
    let url = "https://openapi.gg.go.kr/MovieScreening?key=ce892e04c95cefd2f26f5dfdd9912c68&Type=json&pSize=212"
    AF.request(url).responseJSON { (response) in
      switch response.result {
      case .success(let data):
        do {
          print(data)
          let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
          let json = try JSONDecoder().decode(MovieScreening.self, from: jsonData)
            self.movieTheaters += json.row
//            MovieScreening[1].row ?? []
          self.setMovieTheaterMarker()
        } catch(let error) {
          print(error.localizedDescription)
      }
     case .failure(let error):
      print("failure \(error)")
    }
    }
  }
}

// MARK: - CLLocationManagerDelegate
extension SecondTabViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      if let location = locations.first {
        if checkMove == false {
          let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: location.coordinate.latitude, lng: location.coordinate.longitude))
          cameraUpdate.animation = .easeIn
          mapView.moveCamera(cameraUpdate)
          checkMove = true
        }
      }
  }
}
