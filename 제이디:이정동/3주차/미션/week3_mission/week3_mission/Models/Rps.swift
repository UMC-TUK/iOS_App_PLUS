//
//  Rps.swift
//  week3_mission
//
//  Created by 이정동 on 2023/04/13.
//

import UIKit

enum Rps: Int {
    case rock
    case scissors
    case paper
    
    var rpsInfo: (image: UIImage?, str: String) {
        switch self {
        case .rock: return (UIImage(named: "rock"), "rock")
        case .scissors: return (UIImage(named: "scissors"), "scissors")
        case .paper: return (UIImage(named: "paper"), "paper")
        }
    }
}
