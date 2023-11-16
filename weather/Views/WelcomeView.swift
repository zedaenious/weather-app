//
//  WelcomeView.swift
//  weather
//
//  Created by Matt Zelenak on 11/16/23.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var LocationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Weather App")
                    .bold().font(.title)
                Text("Please share your location to get weather data for your area").padding()
                
            }.multilineTextAlignment(.center).padding()
            
            LocationButton(.shareCurrentLocation) {
                LocationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
