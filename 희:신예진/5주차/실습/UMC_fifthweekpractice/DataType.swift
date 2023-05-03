//
//  DataType.swift
//  UMC_fifthweekpractice
//
//  Created by 신예진 on 2023/05/03.
//


struct SalesPost {
//    let writer: User
    var title: String
    var content: String
    var price: Int?
    var imageString: String = "기본이미지.jpeg"
//    var category: ProductCategory
    var chattingCount: Int = 0
    var interestCount: Int = 0
    var viewCount: Int = 0
    var identifier: Int
}
