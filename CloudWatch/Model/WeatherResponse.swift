//
//  WeatherResponse.swift
//  CloudWatch
//
//  Created by Максим Самусь on 10.12.2022.
//

import Foundation

// MARK: - Empty
struct WeatherResponse: Codable {
    let lat: Double?
    let lon: Double?
    let timezone: String?
    let current: Current?
    let hourly: [Current]?
    let daily: [Daily]?
    let alerts: [Alert]?
}

// MARK: - Alert
struct Alert: Codable {
    let event: String?
    let start: Int?
    let end: Int?
    let tags: [String]?
}

// MARK: - Current
struct Current: Codable {
    let dt: Int?
    let temp: Double?
    let pressure: Int?
    let humidity: Int?
    let clouds: Int?
    let visibility: Int?
    let weather: [Weather]?
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int?
    let main: Main?
    let icon: Icon?
}

enum Icon: String, Codable {
    case the03D = "03d"
    case the04D = "04d"
    case the04N = "04n"
    case the10D = "10d"
    case the10N = "10n"
    case the13D = "13d"
    case the13N = "13n"
}

enum Main: String, Codable {
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
}

enum Description: String, Codable {
    case lightRain = "light rain"
    case lightSnow = "light snow"
    case moderateRain = "moderate rain"
    case overcastClouds = "overcast clouds"
    case rainAndSnow = "rain and snow"
    case scatteredClouds = "scattered clouds"
    case snow = "snow"
}

// MARK: - Daily
struct Daily: Codable {
    let dt, sunrise, sunset, moonrise: Int
    let moonset: Int?
    let temp: Double?
    let pressure: Int?
    let humidity: Int?
    let dewPoint: Double?
    let windSpeed: Double?
    let weather: [Weather]?
}
