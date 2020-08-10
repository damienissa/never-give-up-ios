//
//  File.swift
//  
//
//  Created by Dima Virych on 10.08.2020.
//

import Foundation

public struct NeverGiveUp {
    
    private static var wasStarted = false
        
    public static func enterBackground() {
        
        wasStarted = true
        VDLocationTracking.shared().startLocationTracking()
    }
    
    public static func enterForeground() {
        
        firstStart()
        
        if !wasStarted {
            return
        }
        
        VDLocationTracking.shared().stopLocationTracking()
        wasStarted = false
    }
}
