//
//  Music.swift
//  week9_practice
//
//  Created by 이정동 on 2023/05/29.
//

import Foundation


struct MusicData: Codable {
    let resultCount: Int
    let results: [Music]
}

struct Music: Codable {
    let songName: String
    let artistName: String
    let albumName: String
    
    enum CodingKeys: String, CodingKey {
        case songName = "trackName"
        case artistName
        case albumName = "collectionName"
    }
}
