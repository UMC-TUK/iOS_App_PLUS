//
//  Photo.swift
//  Week09_Practice
//
//  Created by 우주대스타 on 2023-05-31.
//

import Foundation

struct Photo : Codable {
    var thumbnail : String
    var userName : String
    var likesCount : Int
    var createdAt : String
}
