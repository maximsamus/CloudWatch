//
//  NetworkManager.swift
//  CloudWatch
//
//  Created by Максим Самусь on 8.12.2022.
//

import Foundation
import Alamofire
import CoreLocation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
        
    func getCitiesWeather(cities: [String], with completion: @escaping(Int, WeatherResponse) -> Void) {
        for (index, item) in cities.enumerated() {
            fetchWeather(cityName: item) { weather in
                print(weather.current)
                completion(index, weather)

            }
        }
    }
    
    func fetchWeather(cityName: String, with completion: @escaping(WeatherResponse) -> Void) {
        configureCoordinates(cityName: cityName) { lat, lon in
            let url = "\(API.weatherURL)&lat=\(lat)&lon=\(lon)"
            print(url)
            self.fetchData(from: url) { weather in
                completion(weather)
                print(weather)
            }
        }
    }
    
    func getCoordinates(cityName: String, with completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> Void) {
        CLGeocoder().geocodeAddressString(cityName) { placemark, error in
            completion(placemark?.first?.location?.coordinate, error)
        }
    }
    
    func configureCoordinates(cityName: String, with completion: @escaping(_ lat: Double , _ lon: Double) -> Void) {
        getCoordinates(cityName: cityName) { coordinate, error in
            guard let lat = coordinate?.latitude else { return }
            guard let lon = coordinate?.longitude else { return }
            completion(lat, lon)
        }
    }
    
    func fetchData(from url: String, with completion: @escaping(WeatherResponse) -> Void) {
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
}
