//
//  Transition.swift
//  StateMachine
//
//  Created by Local Administrator on 15/07/2014.
//  Copyright (c) 2014 Local Administrator. All rights reserved.
//

import Foundation

class Transition {
    let event: Event
    let state: State
    let IDcode: String
    
    init(event:Event, state:State, IDcode:String) {
        self.event = event
        self.state = state
        self.IDcode = IDcode
    }
    
    func getEvent() -> Event {
        return self.event
    }
    
    func getState() -> State {
        return self.state
    }
    
    func equals(transition:Transition) -> Bool {
        if self.event.equals(transition.getEvent())
            && self.state.equals(transition.getState()) {
            return true
        }
        return false
    }
    
    func toString() {
        println("Event: \(event.toString()) transitions to: \(state.toString())")
    }
}