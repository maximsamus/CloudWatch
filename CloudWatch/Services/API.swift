//
//  API.swift
//  CloudWatch
//
//  Created by Максим Самусь on 10.12.2022.
//

struct API {
    static let baseURL = "https://api.openweathermap.org/data/3.0/onecall"
    static let key = "fd7062a40b2986130a3103539d4d3e4d"
    static let weatherURL = "\(baseURL)?exclude=minutely&units=metric&appid=\(key)"
}
