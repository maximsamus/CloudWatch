//
//  WeatherResponse.swift
//  CloudWatch
//
//  Created by Максим Самусь on 10.12.2022.
//

import Foundation

//struct ForecastResponse: Codable {
////    let cityName, countryCode: String
//    let data: [Datum]
////    let lat, lon, stateCode, timezone: String
////
////    enum CodingKeys: String, CodingKey {
////        case cityName = "city_name"
////        case countryCode = "country_code"
////        case data, lat, lon
////        case stateCode = "state_code"
////        case timezone
////    }
//}

// MARK: - WeatherResponse
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
    //    let datetime: String
    //    let dewpt: Double
    //    let dhi: Double
    //    let dni: Int
    //    let elevAngle: Double
    //    let ghi: Int
    //    let gust: Double
    //    let hAngle: Int
    //    let lat: Double
    //    let lon: Double
    //        let obTime: String
//        let pod: Pod
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
        String(format: "%.0f", temp)
    }
    let timezone: String
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
        //        case datetime
        //        case dewpt
        //        case dhi
        //        case dni
        //        case elevAngle = "elev_angle"
        //        case ghi
        //        case gust
        //        case hAngle = "h_angle"
        //        case lat
        //        case lon
        //                case obTime = "ob_time"
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
        case timezone
        //        case ts
        //        case uv
        //        case vis
        case weather
        //        case windCdir = "wind_cdir"
        //        case windCdirFull = "wind_cdir_full"
        //        case windDir = "wind_dir"
        //        case windSpd = "wind_spd"
    }
//    enum Pod: String, Codable {
//        case d = "d"
//        case n = "n"
//    }
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

