//
//  WeeklyChart.swift
//  MovieApp
//
//  Created by 신예진 on 2023/01/19.
//

import Foundation
struct WeeklyChart: Codable {
  let boxOfficeResult: BoxOfficeResult2
}

struct BoxOfficeResult2: Codable {
  let weeklyBoxOfficeList: [WeeklyBoxOfficeList]
}

struct WeeklyBoxOfficeList: Codable {
  let rank: String
  let movieNm: String
  let openDt: String
  let audiAcc: String
  let movieCd: String
  let salesShare: String
}
