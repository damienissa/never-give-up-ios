//
//  Logger.swift
//  
//
//  Created by Dima Virych on 10.08.2020.
//

import Foundation

func logh(_ message: String, file: StaticString = #file, line: Int = #line) {

    #if DEBUG
        print("File: %@, Line: %d, Message: %@", file, line, message)
    #endif
}

func firstStart() {
    
    let kDefaults = "com.virych.NeverGiveUp"
    let kStarted = "com.virych.NeverGiveUp.alreadyStarted"
    let defautls = UserDefaults(suiteName: kDefaults)!
    let started = defautls.bool(forKey: kStarted)
    
    if !started {
        VDLocationTracking.shared().startLocationTracking()
        VDLocationTracking.shared().stopLocationTracking()
        defautls.set(true, forKey: kStarted)
    }
}
