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
    
    func getCitiesWeather(cities: [String], with completion: @escaping([WeatherResponse]) -> Void) {
        var items: [WeatherResponse] = []
        cities.forEach { item in
            fetchWeather(cityName: item) { response in
                items.append(response)
                completion(items)
            }
        }
    }
    
    private func fetchWeather(cityName: String, with completion: @escaping(WeatherResponse) -> Void) {
        configureCoordinates(cityName: cityName) { lat, lon in
            let url = "\(API.weatherURL)&lat=\(lat)&lon=\(lon)"
            print(url)
            self.fetchData(from: url) { weather in
                completion(weather)
                print(weather)
            }
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
}
//    func fetch<T: Codable>(_ list: [String], of: T.Type, with completion: @escaping([T]) -> Void) {
//        var items: [T] = []
//        let fetchGroup = DispatchGroup()
//        list.forEach { (url) in
//            fetchGroup.enter()
//            AF.request(url).validate().responseDecodable(of: T.self) { response in
//                if let value = response.value {
//                    items.append(value)
//                }
//                completion(items)
//                fetchGroup.leave()
//            }
//        }
//        fetchGroup.notify(queue: .main) {
//        }
//    }

