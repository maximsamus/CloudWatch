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
    
    func getCitiesWeather(cities: [String], with completion: @escaping(Int, Weather) -> Void) {
        for (index, item) in cities.enumerated() {
            fetchWeather(cityName: item) { weather in
                completion(index, weather)
            }
        }
    }
        private func fetchWeather(cityName: String, with completion: @escaping(Weather) -> Void) {
            getCoordinates(cityName: cityName) { coordinate, error in
                guard let lat = coordinate?.latitude else { return }
                guard let lon = coordinate?.longitude else { return }
                let url = "\(API.weatherURL)&lat=\(lat)&lon=\(lon)"
                self.fetchData(from: url) { weather in
                    completion(weather.current)
                }
            }
            

        }
    
    private func getCoordinates(cityName: String, with completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> Void) {
        CLGeocoder().geocodeAddressString(cityName) { placemark, error in
            completion(placemark?.first?.location?.coordinate, error)
        }
    }
//    private func fetchWeather(cityName: String, with completion: @escaping(Weather) -> Void) {
//        let url = "\(API.weatherURL)&q=\(cityName)"
//        fetchData(from: url) { weather in
//            completion(weather.current)
//        }
//    }
    
    //    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
    //        let url = "\(API.weatherURL)&lat=\(latitude)&lon=\(longitude)"
    //       performRequest(with: url)
    //    }
    
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
    
    //    func searchStarships(for name: String, where url: String, with completion: @escaping(Starships) -> Void) {
    //        let parameters: [String: String] = ["search": name]
    //        AF.request(url, parameters: parameters)
    //            .validate()
    //            .responseDecodable(of: Starships.self) { response in
    //                guard let starships = response.value else { return }
    //                completion(starships)
    //            }
    //    }
    //
    //    func fetch<T: Decodable & Displayable>(_ list: [String], of: T.Type, with completion: @escaping([T]) -> Void) {
    //        var items: [T] = []
    //        let fetchGroup = DispatchGroup()
    //        list.forEach { (url) in
    //            fetchGroup.enter()
    //            AF.request(url).validate().responseDecodable(of: T.self) { (response) in
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
    
}
