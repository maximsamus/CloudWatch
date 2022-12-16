//
//  WeatherResponse.swift
//  CloudWatch
//
//  Created by Максим Самусь on 10.12.2022.
//

import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    let count: Int
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let cityName: String
    let pres: Double
    let windSpd: Double
    let rh: Int
    let solarRAD: Int
    let temp: Double
    let timezone: String
    let weather: Weather
    var tempString: String {
        String(format: "%.0f", temp)
    }
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case pres
        case windSpd = "wind_spd"
        case rh
        case solarRAD = "solar_rad"
        case temp
        case weather
        case timezone
    }
}

// MARK: - Weather
struct Weather: Codable {
    let weatherDescription: String
    let code: Int
    let icon: String
    var conditionName: String {
        switch code {
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
        case code
        case icon
    }
}

