//
//  MemoContents.swift
//  UMC_thirdweekmission
//
//  Created by 신예진 on 2023/04/16.
//

import Foundation

class MemoContents {
    var contents : String       // 메모내용
    var date : Date             // 메모를 저장한 날짜
    
    init(contents: String) {    // 생성자를 만들어 초기값이 설정 될 수 있도록 한다.
        self.contents = contents
        date = Date()
    }
    
    static var imsiList = [     // 테이블뷰에 보여줄 임시데이터를 보관하는 배열을 만들어준다.
        MemoContents(contents: "오늘 날씨 너무 좋다"),
        MemoContents(contents: "^^휴학하고 싶다^^"),
        MemoContents(contents: "대학생 학대기간 시작")
    ]
}
