//
//  Model.swift
//  test
//
//  Created by 우주대스타 on 2023-05-01.
//

import Foundation

class MemoList {
    var title: String
    var insertDate: Date
    var content: String

    init(title: String, content: String) {
        self.title = title
        insertDate = Date()
        self.content = content
    }

    static var dummyMemoList = [
        MemoList(title: "UMC Week03", content: "UMC WEEK03_Mission"),
        MemoList(title: "🫠🍯😈", content: "🫠🍯😈")
    ]
}
