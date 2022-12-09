//
//  Weather.swift
//  CloudWatch
//
//  Created by Максим Самусь on 8.12.2022.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let count: Int
    let data: [Data]
}

// MARK: - Data
struct Data: Codable {
    let appTemp: Double
    let aqi: Int
    let cityName: String
    let clouds: Int
    let countryCode, datetime: String
    let dewpt, dhi, dni, elevAngle: Double
    let ghi, gust: Double
    let hAngle: Int
    let lat, lon: Double
    let obTime, pod: String
    let precip: Int
    let pres: Double
    let rh: Int
    let slp: Double
    let snow: Int
    let solarRAD: Double
    let sources: [String]
    let stateCode, station, sunrise, sunset: String
    let temp: Double
    let timezone: String
    let ts: Int
    let uv: Double
    let vis: Int
    let weather: Weather
    let windCdir, windCdirFull: String
    let windDir: Int
    let windSpd: Double

    enum CodingKeys: String, CodingKey {
        case appTemp = "app_temp"
        case aqi
        case cityName = "city_name"
        case clouds
        case countryCode = "country_code"
        case datetime, dewpt, dhi, dni
        case elevAngle = "elev_angle"
        case ghi, gust
        case hAngle = "h_angle"
        case lat, lon
        case obTime = "ob_time"
        case pod, precip, pres, rh, slp, snow
        case solarRAD = "solar_rad"
        case sources
        case stateCode = "state_code"
        case station, sunrise, sunset, temp, timezone, ts, uv, vis, weather
        case windCdir = "wind_cdir"
        case windCdirFull = "wind_cdir_full"
        case windDir = "wind_dir"
        case windSpd = "wind_spd"
    }
}

// MARK: - Weather
struct Weather: Codable {
    let icon, weatherDescription: String
    let code: Int

    enum CodingKeys: String, CodingKey {
        case icon
        case weatherDescription = "description"
        case code
    }
}
