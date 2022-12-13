//
//  API.swift
//  CloudWatch
//
//  Created by Максим Самусь on 10.12.2022.
//

struct API {
    static let baseURL = "https://api.weatherbit.io/v2.0/current"
    static let key = "7dd3708916684bd383dd005609825f55"
    static let weatherURL = "\(baseURL)?include=daily&include=hourly&key=\(key)"
}
