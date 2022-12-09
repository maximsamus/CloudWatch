//
//  NetworkManager.swift
//  CloudWatch
//
//  Created by Максим Самусь on 8.12.2022.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
//    private var currentURL: String {
//        "https://api.weatherbit.io/v2.0/current?&key="
//    }
//    private var apiKey: String {
//        "7dd3708916684bd383dd005609825f55"
//    }
//    private var forecastURL: String {
//        ""
//    }
    
    private init() { }
    
    func fetchWeather(from url: String, with completion: @escaping(Data) -> Void) {
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
    
    enum Link: String {
        case currentURL = "https://api.weatherbit.io/v2.0/current?key=7dd3708916684bd383dd005609825f55"
        case forecastURL =  ""
    }
}
