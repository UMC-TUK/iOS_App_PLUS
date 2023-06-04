//
//  Service.swift
//  NinethWeek-Mission
//
//  Created by 정호진 on 2023/06/04.
//

import Foundation

final class Service{
    
    func getAPIData(key: String, page: Int, completion: (([Item]) -> ())?){
        
        let url = URL(string:  "https://api.visitjeju.net/vsjApi/contents/searchList?apiKey=\(key)&locale=kr&page=\(page)")
        
        let session = URLSession.shared
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request){ [weak self] (data, res, err) in
            
            if let error = err {
                print("error!\n(\(error)")
                return
            }
            
            guard let data = data else {
                print("No data!!\n");
                return
            }
            guard let res = res as? HTTPURLResponse else{ return}
            
            
            let json = try? JSONDecoder().decode(Result.self, from: data)
            
            switch res.statusCode{
            case (200...299):
                completion?(json!.items)
            default:
                print("error!!!")
            }
        }.resume()
    }
    
}
