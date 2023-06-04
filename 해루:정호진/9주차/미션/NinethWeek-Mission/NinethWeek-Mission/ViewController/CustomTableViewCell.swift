//
//  CustomTableViewCell.swift
//  NinethWeek-Mission
//
//  Created by 정호진 on 2023/06/04.
//

import Foundation
import UIKit

final class CustomTableViewCell: UITableViewCell{
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func inputData(imgPath: String, title: String){
        self.title.text = title
        img.layer.cornerRadius = 30
        inputImage(path: imgPath)
    }
    
    private func inputImage(path: String) {
        DispatchQueue.global().async {
            guard let url = URL(string: path), let data = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.img.image = UIImage(data: data)?.resize(newWidth: self.frame.width-20,
                                                             newHeight: self.img.frame.height)
            }
        }
    }
}

extension UIImage {
    // MARK: 이미지 크기 재배치 하는 함수
    func resize(newWidth: CGFloat, newHeight: CGFloat) -> UIImage {
        let scale = newWidth / self.size.width
        
        let size = CGSize(width: newWidth, height: newHeight)
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { context in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        return renderImage
    }
}
