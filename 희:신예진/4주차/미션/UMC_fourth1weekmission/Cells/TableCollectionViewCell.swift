//
//  TableCollectionViewCell.swift
//  UMC_fourth1weekmission
//
//  Created by 신예진 on 2023/05/05.
//

import UIKit

class TableCollectionViewCell: UICollectionViewCell {

    static let identifier = "TableCollectionViewCell"
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
        
    }()
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myImageView.frame = CGRect(x: 5, y: 5,
                                   width: contentView.frame.size.width-10,
                                   height: contentView.frame.size.height-5-50)
        myLabel.frame = CGRect(x: 5,
                               y: contentView.frame.size.height-50,
                                   width: contentView.frame.size.width-10,
                                   height: 50)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: CollectionTableCellModel){
        myLabel.text = model.title
        myImageView.image = UIImage(named: model.imageName)
        
        
    }
    
}
