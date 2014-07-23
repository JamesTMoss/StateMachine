//
//  Command.swift
//  StateMachine
//
//  Created by Local Administrator on 15/07/2014.
//  Copyright (c) 2014 Local Administrator. All rights reserved.
//

import Foundation

class Command {
    
    let IDcode: String
    
    init() {
        self.IDcode = "0000"
    }
    
    init(IDcode: String) {
        self.IDcode = IDcode
    }

    //Performs some given function.
    func go() -> Bool {
        return true
    }
    
    func equals(command:Command) -> Bool {
        return self.IDcode == command.IDcode
    }
    
    func toString() {
        print("\(IDcode)")
    }
}