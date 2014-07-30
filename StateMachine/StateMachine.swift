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

enum Config {
    case Transition(Config, Config, Config)
    case State(String, Config)
    case Event(String)
    case Actions([String])
}


class StateMachine {
    

    var states: [State] = []
    var events: [Event] = []
    var actions: [Command] = []
    var currentState: State {
        get {
            return self.currentState
        }
        set {
            self.currentState = states[0]
        }
    }
    
    init(StateMachineConfiguration: [Config]) {
        for transition in StateMachineConfiguration {
            switch transition{
            case .Transition(let startState, let endState, let event):
                var startName, endName, eventName: String
                switch startState{
                case .State(let stateName, let Actions):
                    self.addState(startState)
                    startName = stateName
                }
                switch endState{
                case .State(let stateName, let Actions):
                    self.addState(endState)
                    endName = stateName
                }
                
                switch event {
                case .Event(let eventID):
                    var newEvent = true
                    eventName = eventID
                    for e in events { if eventID == e.IDcode { newEvent = false} }
                    if newEvent {
                        events.append(Event(IDcode: eventID))
                    }
                }
                self.getState(startName)!.setTransition(self.getEvent(eventName)!, state: self.getState(endName)!)
            }
        }
    }
    
    func addState(StateConfiguration: Config) {
        var newState = true
        var stateActions: [Command] = []
        switch StateConfiguration  {
        case .State(let stateName, let acts):
            for i in 0..<states.count {if stateName == states[i].IDcode { newState = false }}
            switch acts {
            case .Actions(let _actions):
                var newAction = true;
                for i in 0..<_actions.count {
                    if actions[i].IDcode == _actions[i] {
                        newAction = false
                        stateActions.append(actions[i])
                    }
                
                    if newAction {
                        actions.append(Command(IDcode: _actions[i]))
                        stateActions.append(actions[actions.endIndex])
                    }
                }
            }
        if newState { states.append(State(id: stateName, actions: stateActions))}
        }
    }
    
    func getState(id: String) -> State? {
        for state in states {
            if state.IDcode == id { return state }
        }
        return nil
    }
    
    func getEvent(id: String) -> Event? {
        for event in events {
            if event.IDcode == id { return event }
        }
        return nil
    }
    
    //Transition to new state based on a fired event.
    func transition(event:String) {
        if currentState.hasTransition(event) {
           currentState = currentState.getTransition(event)
        } else {
            println("Can not perform transition")
        }
    }
    
    //activates the primary function of a state command.
    func performAction(action:String) {
        if currentState.hasAction(action) {
            currentState.getAction(action).go()
        } else {
            println("Can not perform Action")
        }
    }
    
    func printCurrentState() {
        currentState.printActions()
        currentState.printTransitions()
    }
}