//
//  TableViewModel.swift
//  UMC_fifthweekpractice
//
//  Created by 신예진 on 2023/05/03.
//


class SalesPostModel {
    private var storage: [SalesPost] = []
    
    // 저장 데이터


    
//    init() {
//        storage = [
//            SalesPost(writer: userModel.returnUserInfo("한소희"), title: "나이키 덩크로우 네이처 페일코랄 255", content: "크림 구매내역 인증 가능", price: 90000, imageString: "나이키.jpg", category: .기타중고물품, identifier: 0),
//            SalesPost(writer: userModel.returnUserInfo("고윤정"), title: "구찌향수", content: "사용한 상태라 싸게 팔아요", price: 10000, imageString: "구찌향수.jpg", category: .디지털기기, identifier: 1),
//            SalesPost(writer: userModel.returnUserInfo("이재욱"), title: "HP프린터", content: "외관 사용감이 있으나 기능 이상없고 인쇄 빠릅니다.", price: 2700000, imageString: "프린터.jpg", category: .남성의류, identifier: 2),
//            SalesPost(writer: userModel.returnUserInfo("레드"), title: "폴딩 미니밸로 루트코리아 그루 m3", content: "여행다니면서 사용해서 s급입니다", price: 266000, imageString: "폴딩.jpg", category: .디지털기기, identifier: 3),
//            SalesPost(writer: userModel.returnUserInfo("블루"), title: "한컴 27인치 커브드 모니터", content: "모니터 닦으면 깨끗합니다. 닦아서 가져갈게요", price: 600000, imageString: "모니터.jpg", category: .가구인테리어, identifier: 4),
//            SalesPost(writer: userModel.returnUserInfo("해피토스트"), title: "보스헤드셋", content: "에눌 가능합니다. 연락주세요", price: 300000, imageString: "보스헤드셋.jpg",category: .여성잡화, identifier: 5)
//        ]
//    }
    
    var count: Int {
        return storage.count
    }
    
    /// 메인화면에서 SalesPost로 데이터를 넘길 때
    /// 메인화면의 tableview index를 가지고 모델에서 데이터를 꺼내오는 함수
    func returnPostInfo(_ index: Int) -> SalesPost {
        return storage[index]
    }
    
    /// UserDefault로 데이터 저장하기 위해 배열을 통째로 리턴하는 함수
    func getStorage() -> [SalesPost] {
        return storage
    }
    
    // 조회수 +1
    func addViewCount(_ identifier: Int) {
        
        let targetIndex = storage.firstIndex(where: {
            $0.identifier == identifier
        })
        storage[targetIndex!].viewCount += 1
    }
    
    // 관심 count 조절
    enum chooseOperator {
        case plus
        case minus
    }
    func calculatInterestCount(_ identifier: Int, choose: chooseOperator) {
        let targetIndex = storage.firstIndex(where: {
            $0.identifier == identifier
        })
        if choose == .plus {
            storage[targetIndex!].interestCount += 1
        }else {
            storage[targetIndex!].interestCount -= 1
        }
    }
    
//    // 글 작성
//    func addPost(writer: String, title: String, content: String, category: ProductCategory, price: Int? = nil) {
//
//        storage.append(SalesPost(writer: userModel.returnUserInfo(writer), title: title, content: content, price: price, category: category, identifier: storage[storage.count-1].identifier+1))
//
//    }
//
//    // 글 수정
//    func modifyPost(identifier: Int, title: String, content: String, category: ProductCategory, price: Int? = nil) {
//        let targetIndex = storage.firstIndex(where: {
//            $0.identifier == identifier
//        })
//        storage[targetIndex!].title = title
//        storage[targetIndex!].content = content
//        storage[targetIndex!].category = category
//        storage[targetIndex!].price = price
//    }
//
////    // 글 삭제
//    func deletePost(_ identifier: Int) {
//
//        let targetIndex = storage.firstIndex(where: {
//            $0.identifier == identifier
//        })
//        storage.remove(at: targetIndex!)
//    }
}
