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
    
    var hourlyForecastWeather: WeatherResponse?
    var weather: WeatherResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let cellNib = UINib(nibName: "ForecastViewCell", bundle: nil)
        hourlyCollectionView.register(UINib(nibName: "ForecastViewCell", bundle: nil), forCellWithReuseIdentifier: "Forecast")
        view.backgroundColor = .blue
        hourlyCollectionView.delegate = self
        hourlyCollectionView.dataSource = self
//            let cell = ForecastViewCell(frame: .zero)
//        cell.reuseIdentifier = "Forecast"
        setLabels()
        addForecast()
    }
    
    private func setLabels() {
        cityName.text = weather?.data.first?.cityName
        temp.text = "\(weather?.data.first?.tempString ?? "")°C"
        descriptionWeather.text = weather?.data.first?.weather.weatherDescription
    }
    private func addForecast() {
        NetworkManager.shared.fetchForecast(cityName: weather?.data.first?.cityName ?? "Warsaw") { weather in
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
        hourlyForecastWeather?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Forecast", for: indexPath) as? ForecastViewCell else { return UICollectionViewCell() }
        guard let hour = hourlyForecastWeather?.data[indexPath.row] else { return ForecastViewCell() }
        cell.configure(weather: hour)
        //               // Configure the cell with the item at the current index
        //               cell.label.text = items[indexPath.item]
        return cell
    }
}
