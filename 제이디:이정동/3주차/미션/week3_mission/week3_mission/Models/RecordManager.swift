//
//  RecordManager.swift
//  week3_mission
//
//  Created by 이정동 on 2023/04/14.
//

import Foundation

class RecordManager {
    private var record = Record(result: "")
    
    func getRecord() -> Record {
        return record
    }
    
    func setRecord(win: Int, draw: Int, lose: Int) {
        record.win += win
        record.draw += draw
        record.lose += lose
        
        if win == lose {
            record.result = "무"
        } else if win > lose {
            record.result = "승"
        } else {
            record.result = "패"
        }
    }
}
