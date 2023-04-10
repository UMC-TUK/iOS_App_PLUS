//
//  ViewController.swift
//  SecondWeek_Mission
//
//  Created by 정호진 on 2023/04/10.
//

import UIKit

class ViewController: UIViewController {
    private let titleList = ["(SDU)인터넷마케팅",
                            "노동인권과 법",
                            "로봇명사와의만남",
                             "소비자행동의이해",
                             "일반화학1",
                             "종합설계1"]
    private let imgList: [UIImage] = [UIImage(systemName: "magazine.fill")!,
                                      UIImage(systemName: "book.closed.fill")!,
                                      UIImage(systemName: "person.line.dotted.person.fill")!,
                                      UIImage(systemName: "cart.fill.badge.questionmark")!,
                                      UIImage(systemName: "cross.vial.fill")!,
                                      UIImage(systemName: "pencil.and.ruler.fill")!,]
    private let dateList = ["일[1~2] 09:30 ~ 11:20",
                            "금[5~7] 13:30 ~ 16:20",
                            "금[1~2] 09:30 ~ 11:20",
                            "금[9~10] 17:25 ~ 19:05",
                            "화[2] 10:30 ~ 11:20",
                            "목[9~13] 17:25 ~ 21:40"]
    private let sectionList = ["1학기",
                               "비정규과목"]
    private let nonClassListTitle = ["2023 컴퓨터 공학부 종합설계",
                                    "[법정의무교육]연구실안전교육",
                                    "[인권센터] 2023 통합폭력예방교육"]
    private let nonClassImgList = [UIImage(systemName: "pencil.and.ruler.fill")!,
                                   UIImage(systemName: "facemask.fill")!,
                                   UIImage(systemName: "hand.raised.slash")!,]
    private let nonClassDateList = ["2023.03.01 ~ 2023.12.31",
                                    "2023.03.27 ~ 2023.04.23",
                                    "2023.04.10 ~ 2023.12.31"]
    
    private let noticeTitle = ["[공통] ZOOM 실시간 강의",
                               "[학생] E-class 동영상 수업 출결 처리 안내",
                               "[학생] [e-Class(LMS)]2022 겨울방학 포팅 업데이트"]
    private let noticeDate = ["2021.09.10",
                              "2021.09.07",
                              "2023.02.21"]
    
    @IBOutlet weak var classTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "title")!)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: nil, action: nil)
            
        
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == classTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClassTableViewCell",for: indexPath) as! ClassTableViewCell
            
            if indexPath.section == 0{
                cell.input(title: titleList[indexPath.row],
                           img: imgList[indexPath.row],
                           date: dateList[indexPath.row])
            }
            else if indexPath.section == 1{
                cell.input(title: nonClassListTitle[indexPath.row],
                           img: nonClassImgList[indexPath.row],
                           date: nonClassDateList[indexPath.row])
            }
            
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell",for: indexPath) as! NoticeTableViewCell
            
            cell.input(title: noticeTitle[indexPath.row], date: noticeDate[indexPath.row])
            
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == classTableView{
            switch section{
            case 0:
                return titleList.count
            case 1:
                return nonClassListTitle.count
            default:
                return 0
            }
        }
        else{
            return noticeTitle.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == classTableView{
            return sectionList[section]
        }
        return nil
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == classTableView{
            return sectionList.count
        }
        return 1
    }
}

