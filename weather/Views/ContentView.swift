//
//  ContentView.swift
//  weather
//
//  Created by Matt Zelenak on 11/16/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Your coordinates are: \(location.longitude), \(location.latitude)")
            } else {
                if (locationManager.isLoading) {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
            
            WelcomeView()
                .environmentObject(locationManager)
        }.background(Color(hue: 0.551, saturation: 1.0, brightness: 1.0))
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
