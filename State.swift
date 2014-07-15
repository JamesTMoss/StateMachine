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
    var transitions: [Transition] = []
    
    init() {
    }
    
    init(action:Command) {
        self.actions.append(action)
    }
    
    init(actions:[Command]) {
        for action in actions {
            self.actions.append(action)
        }
    }
    
    init(transition:Transition) {
        self.transitions.append(transition)
    }
    
    init(transitions:[Transition]) {
        for transition in transitions {
            self.transitions.append(transition)
        }
    }
    
    init(action:Command, transition:Transition) {
        self.actions.append(action)
        self.transitions.append(transition)
    }
    
    init (actions:[Command], transitions:[Transition]) {
        for action in actions {
            self.actions.append(action)
        }
        for transition in transitions {
            self.transitions.append(transition)
        }
    }
    
    init (actions:[Command], transition:Transition) {
        for action in actions {
            self.actions.append(action)
        }
        self.transitions.append(transition)
    }
    
    init (action:Command, transitions:[Transition]) {
        self.actions.append(action)
        for transition in transitions {
            self.transitions.append(transition)
        }
    }
    
    func getActions() -> [Command] {
        return actions
    }
    
    func getAction(index:Int) -> Command {
        return actions[index]
    }
    
    func getTransitions() -> [Transition] {
        return transitions
    }
    
    func getTransition(event:Event) -> Transition {
        for i in 0..<transitions.count {
            if transitions[i].getEvent().equals(event) {
                return transitions[i]
            }
        }
        let nilE: Event = Event()
        let nilTransition: Transition = Transition(event: nilE, state: self)
        return nilTransition
    }
    
    //Returns true if state possess action
    func hasAction(act: Command) -> Bool {
        for action in self.actions {
            if act.equals(action) {
                return true
            }
        }
        return false
    }
    
    //Returns true if state possess transition (based on event, cannot have two transitions in a state with the same event)
    func hasTransition(event: Event) -> Bool {
        for transition in self.transitions {
            if transition.getEvent().equals(event) {
                return true
            }
        }
        return false
    }
    
    //Adds a new command to state.
    func addAction(action: Command) {
        self.actions.append(action)
    }
    
    //Adds a new transition to state.
    func addTransition(transition:Transition) {
        self.transitions.append(transition)
    }
    
    func equals(state:State) -> Bool {
        return true
    }
}