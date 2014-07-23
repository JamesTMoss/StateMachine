//
//  Event.swift
//  StateMachine
//
//  Created by Local Administrator on 15/07/2014.
//  Copyright (c) 2014 Local Administrator. All rights reserved.
//

import Foundation

class Event {
    
    let IDcode: String
    
    init(IDcode: String = "0000") {
        self.IDcode = IDcode
    }
    
    func equals(event:Event) -> Bool {
        return event.IDcode == self.IDcode
    }
    
    func toString() {
        print("\(IDcode)")
    }
}