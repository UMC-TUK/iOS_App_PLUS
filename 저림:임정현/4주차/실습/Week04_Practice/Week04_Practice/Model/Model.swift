//
//  Model.swift
//  Week04_Practice
//
//  Created by 우주대스타 on 2023-05-03.
//

import Foundation

class MemoList {
    var title: String
    var insertDate: Date

    init(title: String) {
        self.title = title
        insertDate = Date()
    }

    static var dummyMemoList = [
        MemoList(title: "😈"),
        MemoList(title: "🫠"),
        MemoList(title: "🍯"),
        MemoList(title: "🍎")
        
    ]
}
