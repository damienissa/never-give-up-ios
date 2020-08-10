//
//  File.swift
//  
//
//  Created by Dima Virych on 10.08.2020.
//

import Foundation

@objc
public protocol NeverGiveUp {
        
    @objc
    static func enterBackground()
    @objc
    static func enterForeground()
}

extension NeverGiveUp {
    
    static func enterBackground() {
        
        VDLocationTracking.shared().startLocationTracking()
    }
    
    static func enterForeground() {
        
        VDLocationTracking.shared().stopLocationTracking()
    }
}
