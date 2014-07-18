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
    
    init() {
        self.IDcode = "0000"
    }
    
    init(IDcode: String) {
        self.IDcode = IDcode
    }
    
    func equals(event:Event) -> Bool {
        return true
    }
    
    func toString() {
        print("\(IDcode)")
    }
}