//
//  StateMachineTests.swift
//  StateMachineTests
//
//  Created by Local Administrator on 14/07/2014.
//  Copyright (c) 2014 Local Administrator. All rights reserved.
//

import Cocoa
import XCTest
import StateMachine

class StateMachineTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func TestTransitions() {
        // This is an example of a functional test case.
        let ts:TimeSheet = TimeSheet()
        let sm:StateMachine = ts.stateMachine;
        
        sm.printCurrentState()
        XCTAssertTrue(sm.currentState.equals(ts.signedOut), "Should have started in the signed out state")
        
        sm.transition(ts.signIn)
        sm.printCurrentState()
        XCTAssertTrue(sm.currentState.equals(ts.signedIn), "Should have transitioned to signed in state")
        
        sm.transition(ts.signOut)
        sm.printCurrentState()
        XCTAssertTrue(sm.currentState.equals(ts.pendingApproval), "Should have transitioned to pending approval state")

        sm.transition(ts.approve)
        sm.printCurrentState()
        XCTAssertTrue(sm.currentState.equals(ts.signedOut), "Should have transitioned to signed out state")
    }
    
    func TestFalseTransitions() {
        // This test case should afirm that unless a state has the ability to transition, then it should not transition.
        let ts:TimeSheet = TimeSheet()
        let sm:StateMachine = ts.stateMachine;
        
        sm.printCurrentState()
        XCTAssertTrue(sm.currentState.equals(ts.signedOut), "Should have started in the signed out state.")
        
        sm.transition(ts.approve)
        sm.printCurrentState()
        XCTAssertFalse(sm.currentState.equals(ts.pendingApproval), "Should not have been able to transition to the pending approval state")
        XCTAssertTrue(sm.currentState.equals(ts.signedOut), "Should still be in the signed out State")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
            self.TestTransitions()
            self.TestFalseTransitions()
        }
    }
    
}
