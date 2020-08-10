//
//  File.swift
//  
//
//  Created by Dima Virych on 10.08.2020.
//

import Foundation

@objc
public class NeverGiveUp: NSObject {
    
    private static var wasStarted = false
        
    @objc
    public static func enterBackground() {
        
        wasStarted = true
        VDLocationTracking.shared().startLocationTracking()
    }
    
    @objc
    public static func enterForeground() {
        
        firstStart()
        
        if !wasStarted {
            return
        }
        
        VDLocationTracking.shared().stopLocationTracking()
        wasStarted = false
    }
}
