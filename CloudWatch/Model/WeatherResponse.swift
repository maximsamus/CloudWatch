//
//  WeatherResponse.swift
//  CloudWatch
//
//  Created by Максим Самусь on 10.12.2022.
//

import Foundation

struct WeatherResponse: Codable {
        let current: Weather
        let hourly: [Weather]
        let daily: [DailyWeather]
}

struct Coordinate: Codable {
    let name: String
    let lat, lon: Double
    let country: String
}
