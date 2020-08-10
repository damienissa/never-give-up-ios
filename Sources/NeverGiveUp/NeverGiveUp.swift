//
//  File.swift
//  
//
//  Created by Dima Virych on 10.08.2020.
//

import Foundation

@objc
public class NeverGiveUp: NSObject {
        
    @objc
    static func enterBackground() {
        
        VDLocationTracking.shared().startLocationTracking()
    }
    
    @objc
    static func enterForeground() {
        
        VDLocationTracking.shared().stopLocationTracking()
    }
}
