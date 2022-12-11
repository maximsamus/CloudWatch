//
//  API.swift
//  CloudWatch
//
//  Created by Максим Самусь on 10.12.2022.
//

struct API {
    static let baseURL = "https://api.openweathermap.org/data/3.0/onecall"
    static let key = "fd7062a40b2986130a3103539d4d3e4d"
//    static let latAndlonURL = "https://api.openweathermap.org/geo/1.0/direct?appid=\(key)"
    static let weatherURL = "\(baseURL)?exclude=minutely&units=metric&appid=\(key)"
//    static func getURL(lat: Double, lon: Double) -> String {
//        "\(baseURL)?exclude=minutely&units=metric&lat=\(lat)&lon=\(lon)&appid=\(key)"
//    }
}
