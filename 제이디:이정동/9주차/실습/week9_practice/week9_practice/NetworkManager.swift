//
//  NetworkManager.swift
//  week9_practice
//
//  Created by 이정동 on 2023/05/29.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func requestMusicData(_ searchTerm: String) {
        let url = "https://itunes.apple.com/search?media=music&term=\(searchTerm)"
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: ["Content-Type":"application/json", "Accept":"application/json"])
        .validate(statusCode: 200..<300)
        .responseJSON { response in
            
            // 서버로부터 받은 데이터 활용
            switch response.result {
                // 정상적으로 reponse를 받은 경우
            case .success(let data):
                let decoder = JSONDecoder()
                let musicData = try! decoder.decode(MusicData.self, from: response.data!)
                dump(musicData)
            case .failure(let error):
                print(error)
            default:
                break
            }
        }
    }
}
