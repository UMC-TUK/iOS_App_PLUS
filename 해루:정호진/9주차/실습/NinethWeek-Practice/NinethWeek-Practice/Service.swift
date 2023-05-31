//
//  Service.swift
//  NinethWeek-Practice
//
//  Created by 정호진 on 2023/05/31.
//

import Foundation
import Alamofire

final class Service{
    
    func getData(completion: (([Item])-> ())?, key: String){
        let url = "https://api.visitjeju.net/vsjApi/contents/searchList?apiKey=\(key)&locale=kr&page=1"
        AF.request(url,
                   method: .get,
                   encoding: JSONEncoding.default)
        .responseDecodable(of: Result.self) { response in
            switch response.result{
            case .success(let data):
                print("success")
                completion!(data.items)
            case .failure(let error):
                print("getData error!\n\(error)")
            }
        }
        
    }
    
}
