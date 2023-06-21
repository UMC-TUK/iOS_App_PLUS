//
//  MyLogger.swift
//  Week09_Practice
//
//  Created by 우주대스타 on 2023-05-31.
//

import Foundation
import Alamofire

final class MyLogger : EventMonitor {
    let queue = DispatchQueue(label: "MyLogger")
    
    func requestDidResume(_ request: Request) {
        print("MyLogger - requestDidResume() called")
        debugPrint(request)
    }

    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        
        print("MyLogger - request.didParseResponse()")
        debugPrint(response)
    }
}
