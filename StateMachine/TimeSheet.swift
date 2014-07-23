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

class TimeSheet {
    let signIn:Event            = Event(IDcode:"SGNI")
    let signOut:Event           = Event(IDcode: "SGNO")
    let approve:Event           = Event(IDcode: "APPR")
    let record:Command          = Command(IDcode: "RCRD")
    let finalise:Command        = Command(IDcode: "FINL")
    let flag:Command            = Command(IDcode: "FLAG")
    let adjustTimeStamp:Command = Command(IDcode: "ADJT")
    let signedIn, signedOut, pendingApproval :State
    let stateMachine: StateMachine
    
    init() {
        //Initialize all States and Transitions.
        signedIn        = State(id: "SIGNIN",  actions: record, flag, adjustTimeStamp)
        signedOut       = State(id: "SIGNOUT", actions: record, finalise, adjustTimeStamp)
        pendingApproval = State(id: "PENDAPP", actions: finalise)
        signedIn        .setTransition(signOut, state: pendingApproval)
        signedOut       .setTransition(signIn, state: signedIn)
        pendingApproval .setTransition(approve, state: signedOut)
        
        //Initialize state machine with all states.
        stateMachine = StateMachine(states: signedIn, signedOut, pendingApproval)
        stateMachine.currentState = signedOut
    }
    
    func getStateMachine() -> StateMachine {
        return stateMachine
    }
}

