//
//  MyInfo.swift
//  Week10_Practice
//
//  Created by 우주대스타 on 2023-06-20.
//

import Foundation

class MyInfo {
    static let shared = MyInfo()
    
    var name : String?
    var age : Int?
    var female : Bool?
    
    private init() { }
}
