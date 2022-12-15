//
//  NetworkManager.swift
//  CloudWatch
//
//  Created by Максим Самусь on 8.12.2022.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
    
    func getTimeFromTimeZone(from timezone: String, with completion: @escaping(String) -> Void) {
        let date = Date()
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: timezone) ?? TimeZone(identifier: "Europe/Rome")!
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        completion("\(hour):\(minute):\(second)")
    }
    
    func getCitiesWeather(cities: [String], with completion: @escaping([WeatherResponse]) -> Void) {
        var items: [WeatherResponse] = []
        cities.forEach { item in
            fetchWeather(cityName: item) { response in
                items.append(response)
                completion(items)
            }
        }
    }
    
    func fetchForecast(cityName: String, with completion: @escaping(ForecastResponse) -> Void) {
        let url = "\(API.forecastHourlyWeatherURL)&city=\(cityName)"
        fetch(from: url) { forecastResponse in
            completion(forecastResponse)
        }
    }
    
    private func fetchWeather(cityName: String, with completion: @escaping(WeatherResponse) -> Void) {
        let url = "\(API.weatherURL)&city=\(cityName)"
        self.fetch(from: url) { weatherResponse in
            completion(weatherResponse)
        }
    }
    
    private func fetch<T: Codable>(from url: String, with completion: @escaping(T) -> Void) {
        AF.request(url)
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let responseData):
                    completion(responseData)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
