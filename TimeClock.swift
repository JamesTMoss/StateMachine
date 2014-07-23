//
//  TimeClock.swift
//  StateMachine
//
//  Created by Local Administrator on 21/07/2014.
//  Copyright (c) 2014 Local Administrator. All rights reserved.
//

import Foundation

class TimeClock {

    var staff:[Staff] = []
    //let data: [Int:[String]]
    
    init() {
    }
    
    func addStaff(staff: Staff) {
        
    }
    
    func removeStaff(staff: Staff) {
        
    }
    
    func getStaff(id: Int) {
        
    }
    
    func signOn(staff: Staff) {
        if staff.getCurrentState().equals(staff.timeSheet.signedOut) {
            let date = NSDate()
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute, fromDate: date)
            let hour = components.hour
            let minutes = components.minute
            let newRecord: String = "Signed in at \(hour):\(minutes)"
            //let record:[String] = data[staff.id]!
            //record.append(newRecord: String.self)
            //data.updateValue(record, staff.id)
            //staff.getTimeSheet().fireEvent("SGNOUT")
        } else {
            println("Already Signed in")
        }
    }
    
    func signOff(staff: Staff) {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute, fromDate: date)
        let hour = components.hour
        let minutes = components.minute
    }
    
}