//
//  NetworkManager.swift
//  CloudWatch
//
//  Created by Максим Самусь on 8.12.2022.
//

import Foundation
import Alamofire
import CoreLocation

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
    
    //    func getForecast(city: String, with completion: @escaping([WeatherResponse]) -> Void) {
    //        var items: [WeatherResponse] = []
    //        cities.forEach { item in
    //            fetchWeather(cityName: item) { response in
    //                items.append(response)
    //                completion(items)
    //            }
    //        }
    //    }
    
    private func fetchWeather(cityName: String, with completion: @escaping(WeatherResponse) -> Void) {
        let url = "\(API.weatherURL)&city=\(cityName)"
        //        self.fetch(from: url) { weather in
        //            completion(weather)
        self.fetch(from: url) { weatherResponse in
            completion(weatherResponse)
        }
    }
    
    
    func fetchForecast(cityName: String, with completion: @escaping(ForecastResponse) -> Void) {
        let url = "\(API.forecastHourlyWeatherURL)&city=\(cityName)"
        //        self.fetchData1(from: url) { weather in
        //            completion(weather)
        fetch(from: url) { forecastResponse in
            completion(forecastResponse)
        }
    }
    
    
    private func getCoordinates(cityName: String, with completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> Void) {
        CLGeocoder().geocodeAddressString(cityName) { placemark, error in
            completion(placemark?.first?.location?.coordinate, error)
        }
    }
    
    private func configureCoordinates(cityName: String, with completion: @escaping(_ lat: Double , _ lon: Double) -> Void) {
        getCoordinates(cityName: cityName) { coordinate, error in
            guard let lat = coordinate?.latitude else { return }
            guard let lon = coordinate?.longitude else { return }
            completion(lat, lon)
        }
    }
    
    private func fetchData(from url: String, with completion: @escaping(WeatherResponse) -> Void) {
        AF.request(url)
            .validate()
            .responseDecodable(of: WeatherResponse.self) { response in
                switch response.result {
                case .success(let responseData):
                    completion(responseData)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    private func fetchData1(from url: String, with completion: @escaping(ForecastResponse) -> Void) {
        AF.request(url)
            .validate()
            .responseDecodable(of: ForecastResponse.self) { response in
                switch response.result {
                case .success(let responseData):
                    completion(responseData)
                case .failure(let error):
                    print(error.localizedDescription)
                }
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
