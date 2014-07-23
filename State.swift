//
//  State.swift
//  StateMachine
//
//  Created by Local Administrator on 14/07/2014.
//  Copyright (c) 2014 Local Administrator. All rights reserved.
//
//  
//
//
//
//

import Foundation

class State {
    var actions: [Command] = []
    let IDcode: String
    typealias Transition = [String: State]
    var transitions: Transition = Transition()
    
    init(id: String = "0000", actions:Command...) {
        self.IDcode = id
        self.actions = actions
    }
    
    func getActions() -> [Command] {
        return self.actions
    }
    
    func getAction(id:String) -> Command {
        if hasAction(id) {
            for action in getActions() {
                if id == action.IDcode { return action }
            }
        }
        return Command(IDcode: "NULL")
    }
    
    //Returns true if state possess action
    func hasAction(id: String) -> Bool {
        for action in getActions() {
            if action.equals(action) {
                return true
            }
        }
        return false
    }
    
    func getTransitions() -> Transition {
        return transitions
    }
    
    func getTransition(key:String) -> State {
        for event in transitions.keys {
            if event == key { return transitions[key]! }
        }
        return State(id: "null", actions: Command(IDcode: "Null"))
    }
    
    //Returns true if state possess transition (based on event, cannot have two transitions in a state with the same event)
    func hasTransition(key: String) -> Bool {
        for event in getTransitions().keys {
            if event == key { return true }
        }
        return false
    }
    
    func setTransition(event:Event, state:State) {
        if !hasTransition(event.IDcode) {
            transitions[event.IDcode] = state
        }
    }
    
    //Adds a new command to state.
    func addAction(action: Command) {
        self.actions.append(action)
    }
    
    func getIDcode() -> String {
        return self.IDcode
    }
    
    func equals(state:State) -> Bool {
        if state.IDcode == self.IDcode {
            return true;
        }
        return false
    }
    
    //Test Functions
    func printActions() {
        for i in 0..<actions.count {
            println("\(i):   \(actions[i].toString())")
        }
    }
    
    func printTransitions() {
        for key in getTransitions().keys {
            let state = transitions[key]
            println("\(key):   \(state?.toString())")
        }
    }
    
    func toString() {
        print("\(self.IDcode)")
    }
}