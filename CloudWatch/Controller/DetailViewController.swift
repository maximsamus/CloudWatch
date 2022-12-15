//
//  DetailViewController.swift
//  CloudWatch
//
//  Created by Максим Самусь on 13.12.2022.
//

import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var descriptionWeather: UILabel!
    @IBOutlet weak var hourlyCollectionView: UICollectionView!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    var hourlyForecastWeather: ForecastResponse?
    var weather: WeatherResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addForecast()
//        print(hourlyForecastWeather ?? "00000")
        setLabels()
//        hourlyCollectionView.register(ForecastCell.self, forCellWithReuseIdentifier: ForecastCell.identifier)
        view.backgroundColor = .systemBlue
        hourlyCollectionView.delegate = self
        hourlyCollectionView.dataSource = self
//        UIBarButtonItem.init().tintColor = .white
//        let button = UIBarButtonItem(barButtonSystemItem: <#T##UIBarButtonItem.SystemItem#>, target: <#T##Any?#>, action: <#T##Selector?#>)
        backButton.tintColor = .white
        backButton.tintColor = .systemYellow
//        addForecast()
////        print(hourlyForecastWeather ?? "00000")
//        setLabels()
    }
    
    private func setLabels() {
        cityName.text = weather?.data.first?.cityName
        temp.text = "\(weather?.data.first?.tempString ?? "")°C"
        descriptionWeather.text = weather?.data.first?.weather.weatherDescription
    }
    private func addForecast() {
        NetworkManager.shared.fetchForecast(cityName: "Warsaw") { weather in
            self.hourlyForecastWeather = weather
//            print(weather)
            DispatchQueue.main.async {
                self.hourlyCollectionView.reloadData()
            }
        }
    }
}


// MARK: - Collection View Data Source
extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hourlyForecastWeather?.data.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForecastCell.identifier, for: indexPath) as? ForecastCell else { return UICollectionViewCell() }
        cell.textLabel.text = "hello"
//        guard let city = hourlyForecastWeather else { return ForecastCell() }
//            print(city)
//        guard (hourlyForecastWeather?.data.first) != nil else { return ForecastViewCell() }
//        cell.configure(weather: hour)
        //               // Configure the cell with the item at the current index
        //               cell.label.text = items[indexPath.item]
        return cell
    }
}
