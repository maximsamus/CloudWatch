//
//  ForecastResponse.swift
//  CloudWatch
//
//  Created by Максим Самусь on 15.12.2022.
//

import Foundation


// MARK: - ForecastResponse
struct ForecastResponse: Codable {
    let cityName: String
    let countryCode: String
    let data: [DataResponse]
    let lat: String
    let lon: String
    let stateCode: String
    let timezone: String

    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case countryCode = "country_code"
        case data
        case lat
        case lon
        case stateCode = "state_code"
        case timezone
    }
}

// MARK: - DataResponse
struct DataResponse: Codable {
    let appTemp: Double
    let clouds, cloudsHi, cloudsLow, cloudsMid: Int
    let datetime: String
    let dewpt, dhi, dni, ghi: Double
    let ozone: Double
    let pod: Pod
    let pop: Int
    let precip, pres: Double
    let rh: Int
    let slp, snow, snowDepth, solarRAD: Double
    let temp: Double
    let timestampLocal, timestampUTC: String
    let ts: Int
    let uv, vis: Double
    let weather: Weather
    let windCdir, windCdirFull: String
    let windDir: Int
    let windGustSpd, windSpd: Double

    enum CodingKeys: String, CodingKey {
        case appTemp = "app_temp"
        case clouds
        case cloudsHi = "clouds_hi"
        case cloudsLow = "clouds_low"
        case cloudsMid = "clouds_mid"
        case datetime, dewpt, dhi, dni, ghi, ozone, pod, pop, precip, pres, rh, slp, snow
        case snowDepth = "snow_depth"
        case solarRAD = "solar_rad"
        case temp
        case timestampLocal = "timestamp_local"
        case timestampUTC = "timestamp_utc"
        case ts, uv, vis, weather
        case windCdir = "wind_cdir"
        case windCdirFull = "wind_cdir_full"
        case windDir = "wind_dir"
        case windGustSpd = "wind_gust_spd"
        case windSpd = "wind_spd"
    }
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

//// MARK: - Weather
//struct Weather: Codable {
//    let icon: Icon
//    let weatherDescription: Description
//    let code: Int
//
//    enum CodingKeys: String, CodingKey {
//        case icon
//        case weatherDescription = "description"
//        case code
//    }
//}

enum Icon: String, Codable {
    case c02D = "c02d"
    case c04D = "c04d"
    case c04N = "c04n"
    case s01N = "s01n"
}

enum Description: String, Codable {
    case lightSnow = "Light snow"
    case overcastClouds = "Overcast clouds"
    case scatteredClouds = "Scattered clouds"
}
