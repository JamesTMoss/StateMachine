//
//  Staff.swift
//  StateMachine
//
//  Created by Local Administrator on 21/07/2014.
//  Copyright (c) 2014 Local Administrator. All rights reserved.
//

import Foundation

class Staff {
    
    let name:String
    let id:Int
    let timeSheet: TimeSheet
    
    init(name:String, id: Int) {
        self.name = name
        self.id = id
        self.timeSheet = TimeSheet()
    }
    
    func getCurrentState() -> State {
        return timeSheet.stateMachine.currentState
    }
    
    func getTimeSheet() -> TimeSheet {
        return self.timeSheet
    }
    
}