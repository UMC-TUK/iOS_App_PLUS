//
//  CustomCollectionReusableView.swift
//  Week04_Mission
//
//  Created by 우주대스타 on 2023-05-08.
//

import UIKit

class CustomCollectionReusableView: UICollectionReusableView {
    override init(frame: CGRect) {
            super.init(frame: frame)
        }
        
        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
}
