//
//  WeatherResponse.swift
//  CloudWatch
//
//  Created by Максим Самусь on 10.12.2022.
//

import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    let lat, lon: Double
    let timezone: String
    let current: Current
    let hourly: [Current]
    let daily: [Daily]
}

// MARK: - Current
struct Current: Codable {
    let dt: Int
    let temp: Double
    let pressure: Int
    let humidity: Int
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let weather: [Weather]
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: Main
    let icon: String
}

enum Main: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
    case thunderstorm = "Thunderstorm"
    case drizzle = "Drizzle"
    case atmosphere = "Atmosphere"
}

// MARK: - Daily
struct Daily: Codable {
    let dt, sunrise, sunset, moonrise: Int
    let moonset: Int
    let temp: Temp
    let pressure, humidity: Int
    let weather: [Weather]
    let clouds: Int
    let pop: Double
    let rain: Double?
    let uvi: Double
    let snow: Double?
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}
