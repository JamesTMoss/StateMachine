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
    let stateMachine: StateMachine
    init() {
        stateMachine = StateMachine(StateMachineConfiguration: [
            Config.Transition(Config.State("signedIn",        Config.Actions(["record", "flag", "adjustTimeStamp"])),
                              Config.State("pendingApproval", Config.Actions(["finalise"])),
                              Config.Event("signOut")),
            Config.Transition(Config.State("signedOut",       Config.Actions(["record", "finalise", "adjustTimeStamp"])),
                              Config.State("signedIn",        Config.Actions([])),
                              Config.Event("signIn")),
            Config.Transition(Config.State("pendingApproval", Config.Actions([])),
                              Config.State("signedOut",       Config.Actions([])),
                              Config.Event("approve"))])
    }

    func getStateMachine() -> StateMachine {
        return stateMachine
    }
}

