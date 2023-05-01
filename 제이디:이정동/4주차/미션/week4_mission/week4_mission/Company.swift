//
//  Company.swift
//  week4_mission
//
//  Created by 이정동 on 2023/05/02.
//

import UIKit

struct Company {
    var name: String
    var logo: UIImage?
    var desc: String
}


class CompanyDataModel {
    static let shared = CompanyDataModel()
    private init() {}
    
    var companies: [Company] = [
        Company(name: "Google", logo: UIImage(named: "google"), desc: "구글(Google)은 웹 검색, 포털 사이트, 또는 플랫폼을 운영하고 광고를 주요 수익모델 영역으로 하는 미국의 다국적 IT 회사, 또는 구글 사가 서비스하는 검색 엔진을 가리킨다. 전 세계에서 압도적 1위를 차지하는 검색 엔진이며, 2018년부로 20주년을 맞는 다국적 기업이자 역사상 가장 큰 인터넷 기업 중 하나로 마이크로소프트, 아마존닷컴, Apple과 함께 MAGA의 일원이다."),
        Company(name: "Apple", logo: UIImage(named: "apple"), desc: "Apple(애플)은 1976년 4월 1일에 설립된 미국의 IT 기업이다. 하드웨어, 소프트웨어, 온라인 서비스 등을 디자인·설계, 개발, 제조·제작, 판매한다."),
        Company(name: "Coupang", logo: UIImage(named: "coupang"), desc: "대한민국의 이커머스 대기업. 창업자는 한국계 미국인인 Bom Kim (한국명 김범석)이며, 2023년 기준 재계서열 45위이다."),
        Company(name: "Facebook", logo: UIImage(named: "facebook"), desc: "페이스북은 2004년 2월 4일 당시 19살이었던 하버드 대학교 학생 마크 저커버그와 에드와도 새버린이 학교 기숙사에서 사이트를 개설하며 창업하였고, 개설 첫 달에 더스틴 모스코비츠와 크리스 휴스가 동업자로 합류하여 만들어진 소셜 미디어다."),
        Company(name: "KAKAO", logo: UIImage(named: "kakao"), desc: "카카오는 다양한 모바일 및 인터넷 서비스를 제공하는 IT 기업이다. 2022년 기준 재계서열 15위다.2022년 공정거래위원회 발표. 2021년 6월 이후 국내 시가총액 3위~6위에 랭크되기도 했다."),
        Company(name: "LINE", logo: UIImage(named: "line"), desc: "일본 도쿄 신주쿠구에 소재한 IT 기업으로 네이버와 소프트뱅크의 50대50 합작 지주회사인 A홀딩스 산하 Z홀딩스 산하의 기업이다. 회사의 경영은 소프트뱅크가, 상품 개발은 네이버가 맡고 있다. 대표적인 서비스로 메신저 라인이 있다."),
        Company(name: "Microsoft", logo: UIImage(named: "microsoft"), desc: "미국에 위치한 세계 최대규모 소프트웨어 기업. 본사는 워싱턴 주 시애틀 근처의 레드먼드(Redmond)에 있다."),
        Company(name: "Naver", logo: UIImage(named: "naver"), desc: "네이버(NAVER)는 대한민국 포털 사이트이다. 검색 엔진 등 포털 서비스를 중심으로 블로그, 카페, 포스트 등의 커뮤니티 서비스를 비롯하여 뉴스, 스포츠, 연예, 쇼핑 등 다양한 콘텐츠 주제판을 제공하고 있다."),
        Company(name: "Toss", logo: UIImage(named: "toss"), desc: "2013년 8월에 설립된 대한민국의 핀테크 스타트업 비바리퍼블리카가 운영하는 종합 금융 플랫폼로 간편 송금을 주 기능으로 한다."),
        Company(name: "우아한 형제들", logo: UIImage(named: "woowa"), desc: "대한민국의 지주회사. 배달의민족의 운영사이다.")
    ]
}
