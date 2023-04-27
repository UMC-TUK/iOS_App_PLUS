//
//  Company.swift
//  week4_practice
//
//  Created by 이정동 on 2023/04/27.
//

import UIKit

struct Company {
    var name: String
    var image: UIImage
    var descript: String
}

var companies: [Company] = [
    Company(name: "google", image: UIImage(named: "google")!, descript: "구글(영어: Google LLC)은 구글 검색을 중심으로 스마트폰 운영체제인 안드로이드와 유튜브 사업, 클라우드 사업을 하는 미국의 기업이다. 다양한 구글 서비스들(메일, 크롬, 지도, 어스, 포토 등)과 함께 '전 세계의 모든 정보들을 체계화하여 모든 사용자가 유익하게 사용할 수 있도록 한다'라는 사명을 가지고 사업을 하고 있다. 인터넷을 사용하여 정보를 공유하는 산업의 가장 큰 기업이며 세계에서 가장 많은 데이터센터, 통신 네트워크와 함께 매일 수십억 명의 사람들에게 수백억 번의 서비스를 제공하고 있다. 2022년 7월 현재 전 세계 검색엔진, 검색량의 90% 이상의 점유율을 가지고 있다."),
    Company(name: "facebook", image: UIImage(named: "facebook")!, descript: "페이스북은 미국 기업 메타가 소유한 온라인 소셜 미디어 및 소셜 네트워크 서비스이다. 2004년 2월 4일에 마크 저커버그(영어: Mark Zuckerberg)가 하버드대 동문이자 룸메이트인 사람들과 함께 웹사이트를 개설했다. 2020년 6월 기준으로, 월 실 사용자(Monthly Active Users)의 수는 약 27억 명이었다. 전 세계 인구 3명 가운데 한 사람이 페이스북을 사용한다고 할 수 있다."),
    Company(name: "naver", image: UIImage(named: "naver")!, descript: "네이버(영어: NAVER)는 1999년 6월에 출시된 대한민국의 포털사이트이다. 또한 네이버는 1997년 2월 26일 이해진, 권혁일, 김보경, 구창진, 오승환, 최재영, 강석호 등으로 구성된 삼성SDS의 사내 벤처에서 '웹글라이더'라는 이름으로 시작해서 1998년 1월에 분리된 네이버컴 주식회사에서 운영하다가 2000년 자회사인 한게임과 합병하여 NHN이 된 후 재분리하여 현재는 네이버(주)에서 운영하고 있다."),
    Company(name: "apple", image: UIImage(named: "apple")!, descript: "애플(영어: Apple Inc.)은 미국 캘리포니아의 아이폰, 아이패드, 애플 워치, 에어팟, 아이맥, 맥북, 맥 스튜디오와 맥 프로, 홈팟 등의 하드웨어와 iOS, iPadOS, macOS 등의 소프트웨어를 설계, 디자인하는 기업이다. 2011년부터 팀 쿡이 CEO를 맡고 있다. \n또한 그 소프트웨어에 애플 앱 스토어, 뮤직, 뉴스, 아케이드, tv, 피트니스, 페이, 저장 클라우드 등의 서비스를 제공한다."),
    Company(name: "kakao", image: UIImage(named: "kakao")!, descript: "주식회사 카카오(영어: Kakao Corp.)는 대한민국의 IT 기업이다. 국내 1위 모바일 메신저인 카카오톡을 비롯하여, 다음, 카카오 T, 멜론 등 다양한 모바일 서비스를 제공하고 있다."),
    Company(name: "microsoft", image: UIImage(named: "microsoft")!, descript: "마이크로소프트(영어: Microsoft Corporation)는 컴퓨팅 파워를 지원해주는 클라우드 컴퓨팅 사업을 중심으로, 기업들의 사업을 디지털 전환과 함께 지원하는 Dynamics 365와 파워포인트, 워드와 엑셀, 원노트, 아웃룩, 팀즈 등의 오피스 365(Office 365), 링크드인, 그리고 Xbox 게임, 컴퓨터 운영체제 소프트웨어인 윈도우(Windows), 검색과 뉴스 등의 사업을 하는 미국의 기업이다. 2014년부터 사티아 나델라가 CEO를 맡고 있다."),
]
