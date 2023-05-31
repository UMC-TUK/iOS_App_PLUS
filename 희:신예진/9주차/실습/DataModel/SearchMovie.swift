//
//  SearchMovie.swift
//  MovieApp
//
//  Created by 신예진 on 2023/01/19.
//

import Foundation

struct SearchMovie: Codable {
  let movieListResult: MovieListResult
}

struct MovieListResult: Codable {
  let movieList: [MovieList]
}

struct MovieList: Codable {
  let movieCd: String
  let movieNm: String
  let genreAlt: String
  let prdtYear: String
    
}
