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
    
    func fetchWeather(cityName: String) {
        let url = "\(API.weatherURL)&q=\(cityName)"
//        performRequest(with: url)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let url = "\(API.weatherURL)&lat=\(latitude)&lon=\(longitude)"
//        performRequest(with: url)
    }
    
    func fetchData(from url: String, with completion: @escaping(Data) -> Void) {
        AF.request(url)
            .validate()
            .responseDecodable(of: Data.self) { response in
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
