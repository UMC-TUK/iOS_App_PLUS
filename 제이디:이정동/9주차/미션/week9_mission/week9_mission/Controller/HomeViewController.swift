//
//  HomeViewController.swift
//  week9_mission
//
//  Created by 이정동 on 2023/06/21.
//

import UIKit
import SPAlert

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var musicSearchTextView: UITextField!
    
    var musicData: [Music] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let alertView = SPAlertView(title: "환영합니다!", preset: .heart)
        alertView.duration = 3
        alertView.present()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MusicTableViewCell", bundle: nil), forCellReuseIdentifier: "MusicTableViewCell")
        tableView.rowHeight = tableView.estimatedRowHeight
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        MusicNetManager.shared.requestMusicData(musicSearchTextView.text ?? "") { musicData in
            self.musicData = musicData.results
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicTableViewCell") as! MusicTableViewCell
        let music = musicData[indexPath.row]
        cell.singerLabel.text = music.artistName
        cell.songLabel.text = music.songName
        cell.albumLabel.text = music.albumName
        return cell
    }
    
    
}
