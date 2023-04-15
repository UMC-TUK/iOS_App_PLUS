//
//  RpsManager.swift
//  week3_mission
//
//  Created by 이정동 on 2023/04/13.
//

import Foundation


class RpsManager {
    private var playerRps = Rps.rock
    
    func getPlayerRps() -> Rps {
        return playerRps
    }
    
    func setPlayerRps(_ rps: Rps) {
        playerRps = rps
    }
    
    func getComputerRps() -> Rps {
        return Rps(rawValue: Int.random(in: 0...2))!
    }
}
