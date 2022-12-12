//
//  WeatherResponse.swift
//  CloudWatch
//
//  Created by Максим Самусь on 10.12.2022.
//

import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    var lat: Double = 0.0
    var lon: Double  = 0.0
    var timezone: String  = ""
    var current: Current = Current()
    var hourly: [Current] = [Current]()
    var daily: [Daily] = [Daily]()
    
    init() { }
}

// MARK: - Current
struct Current: Codable {
    var dt: Int = 0
    var temp: Double = 0.0
    var pressure: Int = 0
    var humidity: Int = 0
    var uvi: Double = 0.0
    var clouds: Int = 0
    var visibility: Int = 0
    var weather: [Weather] = [Weather]()
    
    init() { }
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
