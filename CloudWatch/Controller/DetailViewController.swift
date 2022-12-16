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
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var solarRad: UILabel!
    
    
    var hourlyForecastWeather: ForecastResponse?
    var weather: WeatherResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        hourlyCollectionView.delegate = self
        hourlyCollectionView.dataSource = self
        addForecast()
        setLabels()
    }
    
    private func setLabels() {
        cityName.text = weather?.data.first?.cityName
        temp.text = "\(weather?.data.first?.tempString ?? "")°C"
        descriptionWeather.text = weather?.data.first?.weather.weatherDescription
        pressure.text = "Average pressure is \(weather?.data.first?.pres.rounded() ?? 0.0) mb."
        windSpeed.text = "Average wind speed is \(weather?.data.first?.windSpd.rounded() ?? 0.0) m/s."
        humidity.text = "Average relative humidity is \(weather?.data.first?.rh ?? 0) %."
        solarRad.text = "Average solar radiation is \(weather?.data.first?.solarRAD ?? 0) W/M^2."
    }
    
    private func addForecast() {
        NetworkManager.shared.fetchForecast(cityName: "Warsaw") { weather in
            self.hourlyForecastWeather = weather
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
        guard let city = hourlyForecastWeather?.data[indexPath.item] else { return ForecastCell() }
        cell.configure(weather: city)
        return cell
    }
}
