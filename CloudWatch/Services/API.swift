//
//  API.swift
//  CloudWatch
//
//  Created by Максим Самусь on 10.12.2022.
//

struct API {
//    static let baseURL = "https://api.openweathermap.org/data/3.0/onecall"
//    static let key = "fd7062a40b2986130a3103539d4d3e4d"
//    static let weatherURL = "\(baseURL)?exclude=minutely&units=metric&appid=\(key)"
    static let baseURL = "https://api.weatherbit.io/v2.0/current"
    static let key = "7dd3708916684bd383dd005609825f55"
    static let weatherURL = "\(baseURL)?include=daily&include=hourly&key=\(key)"
}


// https://api.weatherbit.io/v2.0/current?lat=35.7796&lon=-78.6382&key=7dd3708916684bd383dd005609825f55&include=daily&include=hourly
