//
//  API.swift
//  CloudWatch
//
//  Created by Максим Самусь on 10.12.2022.
//

struct API {
    static let key = "7dd3708916684bd383dd005609825f55"
    static let currentWeahterURL = "https://api.weatherbit.io/v2.0/current"
    static let forecastHourlyURL = "https://api.weatherbit.io/v2.0/forecast/hourly"
    static let weatherURL = "\(currentWeahterURL)?include=daily&include=hourly&key=\(key)"
    static let forecastHourlyWeatherURL = "\(forecastHourlyURL)?hours=24&key=\(key)"
}
