//
//  DatailMovie.swift
//  MovieApp
//
//  Created by 신예진 on 2023/01/19.
//

import Foundation

struct DetailMovie: Codable {
  let movieInfoResult: MovieInfoResult
}

struct MovieInfoResult: Codable {
  let movieInfo: MovieInfo
}


struct MovieInfo: Codable {
  let movieCd: String
  let movieNm: String
  let movieNmEn: String
  let showTm: String
  let prdtYear: String
  let openDt: String
  let genres: [Genre]
  let directors: [Director]
  let actors: [Actor]?
}

struct Genre: Codable {
    let genreNm: String
}

struct Director: Codable {
    let peopleNm: String
}

struct Actor: Codable {
    let peopleNm: String
}
