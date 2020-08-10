//
//  VDLocationTracking.swift
//  VDLocationManager
//
//  Created by Hitesh on 03/06/19.
//  Copyright © 2019 Hitesh. All rights reserved.
//

import Foundation
import CoreLocation

public extension Notification.Name {
    static let neverGiveUpHelperNotification: Self = .init(rawValue: "neverGiveUpHelperNotification")
}

class VDLocationTracking: NSObject {
    
    //Constant
    static let timeInternal = 30
    static let accuracy = 200
    
    
    var manager: VDLocationManager!
    var statusCheckedOnce = false
    private static var privateShared : VDLocationTracking?
    
    override init() {
        super.init()
        manager = VDLocationManager(delegate: self)
    }
    
    
    class func shared() -> VDLocationTracking {
        guard let uwShared = privateShared else {
            privateShared = VDLocationTracking()
            return privateShared!
        }
        return uwShared
    }
    
    class func destroy() {
        privateShared = nil
    }
    
    
    func isLocationServiceEnable()->Bool{
        if CLLocationManager.authorizationStatus() == .denied{
            //           showLocationAlert()
            return false
        }else{
            return true
        }
    }
    
    
    func showLocationAlert(){
        print("Please enalble location service")
    }
    
    func startLocationTracking(){
        if CLLocationManager.authorizationStatus() == .authorizedAlways ||  CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            manager.startUpdatingLocation(interval: 30, acceptableLocationAccuracy: 200)
        }else if CLLocationManager.authorizationStatus() == .denied{
            logh("Location service is disable")
        }else{
            manager.requestAlwaysAuthorization()
        }
    }
    
    func stopLocationTracking(){
        manager.stopUpdatingLocation()
    }
}


extension VDLocationTracking:VDLocationManagerDelegate{
    
    func scheduledLocationManager(_ manager: VDLocationManager, didUpdateLocations locations: [CLLocation]) {
        let recentLocation = locations.last!
        logh("Location retrive successfully:\(recentLocation.debugDescription)")
        NotificationCenter.default.post(name: .neverGiveUpHelperNotification, object: nil)
    }
    
    func scheduledLocationManager(_ manager: VDLocationManager, didFailWithError error: Error) {
        logh("Location Error \(error.localizedDescription)")
    }
    
    func scheduledLocationManager(_ manager: VDLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if CLLocationManager.authorizationStatus() == .denied{
            logh("Location service is disable...")
        }else{
            startLocationTracking()
        }
    }
    
    
}
