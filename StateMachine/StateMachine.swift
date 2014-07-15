//
//  StateMachine.swift
//  StateMachine
//
//  Created by Local Administrator on 15/07/2014.
//  Copyright (c) 2014 Local Administrator. All rights reserved.
//
//
//  Contains the mechanics to run through a series of states by fired events and actions.
//  This is an Internal Domain Specific Language to give a framework to a generic state machine
//  which can then be modified to fit more specific domains.
//

import Foundation

class StateMachine {
    
    var states: [State] = []
    var currentState: State
    
    init(state:State) {
        self.states.append(state)
        self.currentState = states[0]
    }
    
    init (states:[State]) {
        for state in states {
            self.states.append(state)
        }
        self.currentState = states[0]
    }
    
    //Transition to new state based on a fired event.
    func transition(event:Event) {
        if currentState.hasTransition(event) {
            self.currentState = self.currentState.getTransition(event).getState()
        }
    }
    
    //activates the primary function of a state command.
    func performAction(action:Command) {
        if currentState.hasAction(action) {
            action.go()
        }
    }
}