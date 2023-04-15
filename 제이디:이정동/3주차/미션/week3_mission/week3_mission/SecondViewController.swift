//
//  SecondViewController.swift
//  week3_mission
//
//  Created by 이정동 on 2023/04/13.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var computer: UIImageView!
    @IBOutlet weak var player: UIImageView!
    
    var preview: ViewController!
    var total: Int!
    var rpsManager = RpsManager()
    var recordManager = RecordManager()
    var recordArray: [Int] = [0, 0, 0]
    var rpsResultArray: [RpsResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    @IBAction func imageButtonTapped(_ sender: UIButton) {
        player.image = sender.currentImage
        guard let title = sender.currentTitle else { return }
        switch title {
        case "rock": rpsManager.setPlayerRps(.rock)
        case "scissors": rpsManager.setPlayerRps(.scissors)
        case "paper": rpsManager.setPlayerRps(.paper)
        default: return
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if let title = sender.currentTitle, title == "돌아가기" {
            preview.records.insert(recordManager.getRecord(), at: 0)
            navigationController?.popViewController(animated: true)
            return
        }
        
        let com = rpsManager.getComputerRps()
        let player = rpsManager.getPlayerRps()
        
        computer.image = com.rpsInfo.image
        
        var rpsResult = RpsResult(com: computer.image!, player: self.player.image!, result: "")
        
        if com.rpsInfo.str == player.rpsInfo.str {
            result.text = "Draw"
            recordArray[1] += 1
            rpsResult.result = "Draw"
        } else if ((com.rpsInfo.str == "rock") && (player.rpsInfo.str == "scissors") ||
                   (com.rpsInfo.str == "scissors") && (player.rpsInfo.str == "paper") ||
                   (com.rpsInfo.str == "paper") && (player.rpsInfo.str == "rock")) {
            result.text = "Lose"
            recordArray[2] += 1
            rpsResult.result = "Lose"
        } else {
            result.text = "Win"
            recordArray[0] += 1
            rpsResult.result = "Win"
        }
        
        rpsResultArray.insert(rpsResult, at: 0)
        tableView.reloadData()
        
        total -= 1
        if total == 0 {
            recordManager.setRecord(win: recordArray[0], draw: recordArray[1], lose: recordArray[2])
            sender.setTitle("돌아가기", for: .normal)
        }
    }
    
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rpsResultArray.count == 0 ? 1 : rpsResultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if rpsResultArray.count != 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecordTableViewCell", for: indexPath) as! RecordTableViewCell
            
            cell.comImage.image = rpsResultArray[indexPath.row].com
            cell.playerImage.image = rpsResultArray[indexPath.row].player
            
            switch rpsResultArray[indexPath.row].result {
            case "Win": cell.containerView.backgroundColor = .blue
            case "Draw": cell.containerView.backgroundColor = .lightGray
            case "Lose": cell.containerView.backgroundColor = .red
            default: return UITableViewCell()
            }
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyTableViewCell", for: indexPath) as! EmptyTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if rpsResultArray.count != 0 {
            return 100
        } else {
            return tableView.frame.height
        }
    }
    
}
