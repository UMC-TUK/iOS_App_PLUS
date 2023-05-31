//
//  MyApiStatusLogger.swift
//  Week09_Practice
//
//  Created by 우주대스타 on 2023-05-31.
//

import Foundation
import Alamofire

final class MyApiStatusLogger : EventMonitor {
    let queue = DispatchQueue(label: "MyApiStatusLogger")
    
//    func requestDidResume(_ request: Request) {
//        print("MyLogger - requestDidResume() called")
//        debugPrint(request)
//    }
//
    func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {
        
        guard let statusCode = request.response?.statusCode else { return }
        
        print("MyApiStatusLogger - statusCode : \(statusCode)")
//        debugPrint(response)
    }
}
