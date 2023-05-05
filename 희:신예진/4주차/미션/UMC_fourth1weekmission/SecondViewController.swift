//
//  SecondViewController.swift
//  UMC_fourth1weekmission
//
//  Created by 신예진 on 2023/05/06.
//

import Foundation
import UIKit



class SecondViewController:UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var table = [
        Movie(movieImage: "11", movieName: "교섭", num: "1"),
        Movie(movieImage: "12", movieName: "에이전트 A.K.A", num: "2"),
        Movie(movieImage: "13", movieName: "길복순", num: "3"),
        Movie(movieImage: "14", movieName: "인비테이션", num: "4"),
        Movie(movieImage: "15", movieName: "미시즈 해리스 파리에 가다", num: "5"),
        Movie(movieImage: "16", movieName: "스위치", num: "6"),
        Movie(movieImage: "17", movieName: "백야행 하인 어둠 속을 걷다", num: "7"),
        Movie(movieImage: "18", movieName: "타짜", num: "8"),
        Movie(movieImage: "19", movieName: "극한직업", num: "9"),
        Movie(movieImage: "20", movieName: "코드 8", num: "10")
        
    ]
    
    var arrHeaderSectionTitles = ["공개예정","모두의 인기 컨텐츠","Top10시리즈","Top10영화"]
    var arrFooterSectionTitles = ["공개예정","모두의 인기 컨텐츠","Top10시리즈","Top10영화"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.estimatedRowHeight = 300
//        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.reloadData()
       
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrHeaderSectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = table[indexPath.row]
        let cell  = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieCell
        cell?.movieImage.image = UIImage.init(named: movie.movieImage!)
        cell?.movieName.text = movie.movieName
        cell?.num.text = movie.num
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = table[indexPath.row]
        print("didselected recipe",movie.movieName ?? "")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let movie = table[indexPath.row]
         print("deselected recipe",movie.movieName!)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader =  UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.size.width, height: self.tableView.frame.height*0.03))
        viewHeader.backgroundColor = .black
        let lblTitle = UILabel(frame: CGRect.init(x: 10, y: 0, width: tableView.frame.size.width-20, height: self.tableView.frame.height*0.03))
        lblTitle.text =  arrHeaderSectionTitles[section]
        lblTitle.textColor = .systemRed
        viewHeader.addSubview(lblTitle)
        return viewHeader
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.tableView.frame.height*0.03
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let viewFooter =  UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.size.width, height: self.tableView.frame.height*0.03))
        viewFooter.backgroundColor = .black
        let lblTitle = UILabel(frame: CGRect.init(x: 10, y: 0, width: tableView.frame.size.width-20, height: self.tableView.frame.height*0.03))
        lblTitle.text =  arrFooterSectionTitles[section]
        lblTitle.textColor = .systemBlue
        viewFooter.addSubview(lblTitle)
        return viewFooter
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.tableView.frame.height*0.03
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
}
