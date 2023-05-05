//
//  ViewController.swift
//  UMC_fourth1weekmission
//
//  Created by 신예진 on 2023/05/05.
//

import UIKit
import AVFoundation
import AVKit
import AVFAudio
import AVRouting
import Foundation

class ViewController: UIViewController{

    
    @IBOutlet weak var headerImage: UIImageView!
    

    
    private let table: UITableView = {
        let table = UITableView(frame: .zero, style: . grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        
        
        return table
    }()
    
    private var models = [CellModel]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpModels()
    
        view.addSubview(table)
        table.tableHeaderView = createTableHeader()
        table.delegate = self
        table.dataSource = self
    
        
    }
    
    private func createTableHeader() -> UIView? {
        guard let path = Bundle.main.path(forResource: "video", ofType: "mp4") else {
            debugPrint("video.mp4 not found")
            return nil
        }
        
        let url = URL(fileURLWithPath: path)
        
        let player = AVPlayer.init(url: URL(filePath: path))
        
        player.volume = 0
    
        let headerView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: view.frame.size.width,
                                              height: view.frame.size.width))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = headerView.bounds
        headerView.layer.addSublayer(playerLayer)
        
        
        playerLayer.videoGravity = .resizeAspectFill
        player.play()
        
        
        return headerView
        
    }
    
    private func setUpModels(){
        models.append(.collectionView(models: [
            CollectionTableCellModel(title: "나쁜엄마",
                                     imageName: "1"),
            CollectionTableCellModel(title: "나는솔로",
                                     imageName: "2"),
            CollectionTableCellModel(title: "닥터차정숙",
                                     imageName: "3"),
            CollectionTableCellModel(title: "퀸메이커",
                                     imageName: "4"),
            CollectionTableCellModel(title: "종이달",
                                     imageName: "5"),
            CollectionTableCellModel(title: "기만의여왕",
                                     imageName: "6"),
            CollectionTableCellModel(title: "고딩엄빠",
                                     imageName: "7"),
            CollectionTableCellModel(title: "성+인물 일본편",
                                     imageName: "8"),
            CollectionTableCellModel(title: "미스터선샤인",
                                     imageName: "9"),
            CollectionTableCellModel(title: "더 글로리",
                                     imageName: "10"),
            CollectionTableCellModel(title: "나쁜엄마",
                                     imageName: "1"),
            CollectionTableCellModel(title: "나는솔로",
                                     imageName: "2"),
            CollectionTableCellModel(title: "닥터차정숙",
                                     imageName: "3"),
            CollectionTableCellModel(title: "퀸메이커",
                                     imageName: "4"),
            CollectionTableCellModel(title: "종이달",
                                     imageName: "5"),
            CollectionTableCellModel(title: "기만의여왕",
                                     imageName: "6"),
            CollectionTableCellModel(title: "고딩엄빠",
                                     imageName: "7"),
            CollectionTableCellModel(title: "성+인물 일본편",
                                     imageName: "8"),
            CollectionTableCellModel(title: "미스터선샤인",
                                     imageName: "9"),
            CollectionTableCellModel(title: "더 글로리",
                                     imageName: "10")
        ],
                                      rows: 4))
        
        models.append(.list(models: [
            ListCellModel(title: "평단의 천사를 받은 한국 시리즈"),
            ListCellModel(title: "내가 찜한 콘텐츠"),
            ListCellModel(title: "지금 뜨는 컨텐츠"),
            ListCellModel(title: "한국 드라마"),
            ListCellModel(title: "오늘 대한민국의 TOP 10 시리즈")
        
        ]))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch models[section]{
        case .list(let models): return models.count
        case .collectionView(_, _): return 1
        }
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch models[indexPath.section]{
        case .list(let models):
            let model = models[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            cell.textLabel?.text = model.title
            return cell
            
        case .collectionView(let models, _):
            let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
            
            cell.configure(with: models)
            cell.delegate = self
            return cell
            
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Did select normal list item")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch models[indexPath.section] {
        case .list(_): return 50
        case .collectionView(_, let rows): return 180 * CGFloat(rows)
        }
    }
    
    
}

extension ViewController: CollectionTableViewCellDelegate{
    func didSelectItem(with model: CollectionTableCellModel) {
        print("Selected \(model.title)")
    }
}
