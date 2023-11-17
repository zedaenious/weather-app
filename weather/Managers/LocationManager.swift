//
//  LocationManager.swift
//  weather
//
//  Created by Matt Zelenak on 11/16/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    let weatherManager = WeatherManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate // `locations` are expected to be an array of coordinates
        
        if let loc = location {
            // Task sets context to asynchronous for async/await getCurrentWeather
            Task {
                let stuff = await try? weatherManager.getCurrentWeather(latitude: loc.latitude, longitude: loc.longitude)
            }
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location data", error)
        isLoading = false
    }
}
