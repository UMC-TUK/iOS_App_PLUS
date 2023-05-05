//
//  Models.swift
//  UMC_fourth1weekmission
//
//  Created by 신예진 on 2023/05/05.
//

import Foundation

enum CellModel{
    case collectionView(models: [CollectionTableCellModel], rows: Int)
    case list(models: [ListCellModel])
}

struct ListCellModel{
    let title: String
    
}

struct CollectionTableCellModel{
    let title: String
    let imageName: String
    
}
