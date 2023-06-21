//
//  MyAlamofireManager.swift
//  Week09_Practice
//
//  Created by 우주대스타 on 2023-05-31.
//

import Foundation
import Alamofire
import SwiftyJSON

final class MyAlamofireManager {
    static let shared = MyAlamofireManager()
    
    let interceptors = Interceptor(interceptors:
                                    [
                                        BaseInterceptor()
                                    ])
    //로거 설정
    let monitors = [MyLogger(), MyApiStatusLogger()] as [EventMonitor]
    
    let session : Session
    
    private init() {
        session = Session(interceptor: interceptors, eventMonitors: monitors)
    }
    
    func getPhotos(searchTerm userInput: String, completion : @escaping(Result<[Photo], MyError>)->Void){
        print("MyAlamofireManager - getPhotos() called")
        
        self.session.request(MySearchRouter.searchPhotos(term: userInput)).validate(statusCode: 200..<401).responseJSON(completionHandler: {
            response in
            
            guard let responseValue = response.value else { return }
            
            var photos = [Photo]()
            let responseJson = JSON(response.value!)
            
            let jsonArray = responseJson["results"]
            
            print("jsonArray.size : \(jsonArray.count)")
            
            for (index, subJson): (String, JSON) in jsonArray{
                print("index : \(index), subJson: \(subJson)")
                
                // 데이터 파싱
//                let thumbnail = subJson["urls"]["thumb"].string ?? ""
//                let userName = subJson["user"]["username"].string ?? ""
//                let likeCount = subJson["likes"].intValue ?? 0
//                let createdAt = subJson["created_at"].string ?? ""
                
                guard let thumbnail = subJson["urls"]["thumb"].string,
                      let userName = subJson["user"]["username"].string,
                      let createdAt = subJson["created_at"].string else { return }
                let likeCount = subJson["likes"].intValue ?? 0
                
                let photoItem = Photo(thumbnail: thumbnail, userName: userName, likesCount: likeCount, createdAt: createdAt)
                photos.append(photoItem)
                // 배열에 넣기
                
            }
            if photos.count > 0 {
                completion(.success(photos))
            } else {
                completion (.failure(.noContent))
            }
        })
        
    }
}
