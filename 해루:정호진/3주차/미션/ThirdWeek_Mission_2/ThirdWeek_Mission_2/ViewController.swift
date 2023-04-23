//
//  ViewController.swift
//  ThirdWeek_Mission_2
//
//  Created by 정호진 on 2023/04/23.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var pointList: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var imageBtn: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    private let imageList: [UIImage] = [UIImage(named: "kuma00")!,
                                        UIImage(named: "kuma01")!,
                                        UIImage(named: "kuma02")!]
    private var indexCount = 0
    private var point = 0
    private var time: Double = 0
    private var pointListArray: [Rank] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: 시작버튼 눌렀을 때
    @IBAction func clickedStartBtn(_ sender: Any) {
        startBtn.isHidden = true
        startBtn.isEnabled = true
        imageBtn.isHidden = false
        imageBtn.isEnabled = true
        pointLabel.isHidden = false
        imageBtn.setImage(imageList[indexCount].resize(newWidth: 60), for: .normal)
        indexCount = (indexCount + 1)%3
        
        timer()
    }
    
    // MARK: 게임 시작하고 누른 기록 보는 버튼
    @IBAction func ClickedPointList(_ sender: Any) {
        performSegue(withIdentifier: "rankData", sender: sender)
    }
    
    // MARK: Segue 방식으로 데이터 전달할 때 사용되는 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        pointListArray.sort(by: {$0.point > $1.point})
        
        if segue.identifier == "rankData"{
            let vc = segue.destination as! RankingViewController
            vc.pointListArray = self.pointListArray
        }
    }
    
    // MARK: 곰탱이 사진 클릭 시
    @IBAction func clickedImageBtn(_ sender: Any) {
        imageBtn.setImage(imageList[indexCount].resize(newWidth: 60), for: .normal)
        point += 1
        self.pointLabel.text = String(point)
        indexCount = (indexCount + 1)%3
    }
    
    // MARK: 사용자 이름 및 점수 등록
    private func showAlert(point: Int){
        var name: String = ""
        let alert = UIAlertController(title: "점수 등록", message: nil, preferredStyle: .alert)
        alert.addTextField{ field in
            field.placeholder = "등록할 이름을 입력하세요"
            let okAction = UIAlertAction(title: "등록", style: .default) { action in
                if let firstTextField = alert.textFields?.first {
                    name = firstTextField.text ?? "Unknown"
                    self.pointListArray.append(Rank(name: name, point: point))
                }
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            alert.addAction(cancel)
            alert.addAction(okAction)
        }
        
        self.present(alert,animated: true)
    }
    
    // MARK: 시간 재는 타이머, 제한시간 10초
    private func timer(){
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            self.time += timer.timeInterval
            self.progressBar.progress += 0.1
            
            if self.time == 10 {
                timer.invalidate()
                self.imageBtn.isEnabled = false
                self.imageBtn.isHidden = true
                self.pointLabel.isHidden = true
                self.pointLabel.text = "0"
                self.showAlert(point: self.point)
                self.point = 0
                self.time = 0
                self.progressBar.progress = 0
                self.startBtn.isEnabled = true
                self.startBtn.isHidden = false
            }
        })
    }

}

extension UIImage {
    func resize(newWidth: CGFloat) -> UIImage {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale

        let size = CGSize(width: newWidth, height: newHeight)
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { context in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        return renderImage
    }
}

struct Rank{
    let name: String
    let point: Int
}
