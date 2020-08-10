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
    public static func enterBackground() {
        
        VDLocationTracking.shared().startLocationTracking()
    }
    
    @objc
    public static func enterForeground() {
        
        VDLocationTracking.shared().stopLocationTracking()
    }
}
