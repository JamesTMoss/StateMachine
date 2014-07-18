//
//  TimeSheet.swift
//  StateMachine
//
//  Created by Local Administrator on 15/07/2014.
//  Copyright (c) 2014 Local Administrator. All rights reserved.
//
//  This is a Domain Specific Language based on a state machine framework.
//  The Domain is a Automated Time Sheet system that keeps track signing on and off.
//
//

import Foundation
import StateMachine

class TimeSheet {
    let arrive, depart: Event
    let record, finalise, flag, adjustTimeStamp: Command
    let signedIn, signedOut: State
    let signOn, signOff: Transition
    let stateMachine: StateMachine
    
    init() {
        //Initialize all Events & Commands.
        arrive = Event(IDcode: "ARIV")   ; depart          = Event(IDcode: "DPRT");
        record = Command(IDcode: "RCRD") ; finalise        = Command(IDcode: "FINL") ;
        flag   = Command(IDcode: "FLAG") ; adjustTimeStamp = Command(IDcode: "ADJT");
        
        //Initialize all States and Transitions.
        signedIn    = State(actions: [record, flag, adjustTimeStamp])
        signedOut   = State(actions: [record, finalise, adjustTimeStamp])
        signOn      = Transition(event: arrive, state: signedIn, IDcode: "SGNON")
        signOff     = Transition(event: depart, state: signedOut, IDcode: "SGNOFF")
        signedIn.addTransition(signOff)
        signedOut.addTransition(signOn)
        
        //Initialize state machine with all states.
        stateMachine = StateMachine(states: [signedIn, signedOut])
        stateMachine.currentState = signedOut
    }
    
    func fireEvent(event:Event) {
        stateMachine.transition(event)
    }
    
    func fireCommand(command:Command) {
        stateMachine.performAction(command)
    }
    
}

