//
//  ViewModel.swift
//  NinethWeek-Mission
//
//  Created by 정호진 on 2023/06/04.
//

import Foundation

final class ViewModel{
    let service = Service()
    private let key = "rrq71a2rotyj9tqm"
    var page = 1
    
    func getData(completion: @escaping (([Item]) -> ())){
        service.getAPIData(key: key, page: page) { data in
            completion(data)
        }
        page += 1
    }
    
    
}
