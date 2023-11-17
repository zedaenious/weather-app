//
//  WeatherManager.swift
//  weather
//
//  Created by Matt Zelenak on 11/16/23.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws {
        let apiKey = "381991c0b3cbb5f1359de5e1976da335"
        let reqString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)"
        
        guard let url = URL(string: reqString) else { fatalError("Missing URL")}
        print(url)
    }
}
