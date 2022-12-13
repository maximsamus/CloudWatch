//
//  WeatherResponse.swift
//  CloudWatch
//
//  Created by Максим Самусь on 10.12.2022.
//

import Foundation

// MARK: - Empty
struct WeatherResponse: Codable {
    let count: Int
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    //    let appTemp: Double
    //    let aqi: Int
    let cityName: String
//    let clouds: Int
//    let countryCode: String
    let datetime: String
    //    let dewpt: Double
    //    let dhi: Double
    //    let dni: Int
    //    let elevAngle: Double
    //    let ghi: Int
    //    let gust: Double
    //    let hAngle: Int
    //    let lat: Double
    //    let lon: Double
    //    let obTime: String
    //    let pod: String
    //    let precip: Int
    //    let pres: Double
    //    let rh: Int
    //    let slp: Double
    //    let snow: Int
    //    let solarRAD: Int
    //    let sources: [String]
    //    let stateCode: String
    //    let station: String
    //    let sunrise: String
    //    let sunset: String
    let temp: Double
    var tempString: String {
        String(format: "%.1f", temp)
    }
//    let timezone: String
//    let ts: Int
//    let uv: Int
//    let vis: Int
    let weather: Weather
    //    let windCdir, windCdirFull: String
    //    let windDir: Int
    //    let windSpd: Double
    
    enum CodingKeys: String, CodingKey {
        //        case appTemp = "app_temp"
        //        case aqi
        case cityName = "city_name"
//        case clouds
//        case countryCode = "country_code"
        case datetime
        //        case dewpt
        //        case dhi
        //        case dni
        //        case elevAngle = "elev_angle"
        //        case ghi
        //        case gust
        //        case hAngle = "h_angle"
        //        case lat
        //        case lon
        //        case obTime = "ob_time"
        //        case pod
        //        case precip
        //        case pres
        //        case rh
        //        case slp
        //        case snow
        //        case solarRAD = "solar_rad"
        //        case sources
        //        case stateCode = "state_code"
        //        case station
        //        case sunrise
        //        case sunset
        case temp
//        case tempString
//        case timezone
        //        case ts
        //        case uv
        //        case vis
        case weather
        //        case windCdir = "wind_cdir"
        //        case windCdirFull = "wind_cdir_full"
        //        case windDir = "wind_dir"
        //        case windSpd = "wind_spd"
    }
}

// MARK: - Weather
struct Weather: Codable {
    let weatherDescription: String
    let code: Int
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
        case code
        case icon
    }
}


//// MARK: - WeatherResponse
//struct WeatherResponse: Codable {
//    var lat: Double = 0.0
//    var lon: Double  = 0.0
//    var timezone: String  = ""
//    var current: Current = Current()
//    var hourly: [Current] = [Current]()
//    var daily: [Daily] = [Daily]()
//
//    init() { }
//}
//
//// MARK: - Current
//struct Current: Codable {
//    var dt: Int = 0
//    var temp: Double = 0.0
//    var pressure: Int = 0
//    var humidity: Int = 0
//    var uvi: Double = 0.0
//    var clouds: Int = 0
//    var visibility: Int = 0
//    var weather: [Weather] = [Weather]()
//
//    init() { }
//}
//
//// MARK: - Weather
//struct Weather: Codable {
//    let id: Int
//    let main: Main
//    let icon: String
//}
//
//enum Main: String, Codable {
//    case clear = "Clear"
//    case clouds = "Clouds"
//    case rain = "Rain"
//    case snow = "Snow"
//    case thunderstorm = "Thunderstorm"
//    case drizzle = "Drizzle"
//    case atmosphere = "Atmosphere"
//}
//
//// MARK: - Daily
//struct Daily: Codable {
//    let dt, sunrise, sunset, moonrise: Int
//    let moonset: Int
//    let temp: Temp
//    let pressure, humidity: Int
//    let weather: [Weather]
//    let clouds: Int
//    let pop: Double
//    let rain: Double?
//    let uvi: Double
//    let snow: Double?
//}
//
//// MARK: - Temp
//struct Temp: Codable {
//    let day, min, max, night: Double
//    let eve, morn: Double
//}
