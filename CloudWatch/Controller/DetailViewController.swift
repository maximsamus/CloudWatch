//
//  DetailViewController.swift
//  CloudWatch
//
//  Created by Максим Самусь on 13.12.2022.
//

import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var hourlyCollectionView: UICollectionView!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!

    private let headerView = HeaderView()
    private var headerViewTopConstraint: NSLayoutConstraint?
    private var hourlyForecastWeather: ForecastResponse?
    var weather: WeatherResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addForecast()
        setLabels()
        style()
        layout()
        setUp()
    }
}

// MARK: - Collection View Data Source, Collection View Delegate
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

// MARK: - Scroll view delegate
extension DetailViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        headerView.scrollViewDidScroll(scrollView)
    }
}

// MARK: - Private Methods
extension DetailViewController {
    
    private func style() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        self.navigationController?.navigationBar.barTintColor = .systemBlue
        UINavigationBar.appearance().barTintColor = .systemBlue
        headerView.backgroundColor = .systemBlue
    }
    
    private func layout() {
        scrollView.addSubview(headerView)
        scrollView.contentInset = UIEdgeInsets(top: headerView.frame.height, left: 0, bottom: 0, right: 0)
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: headerView.frame.height, left: 0, bottom: 0, right: 0)
        headerViewTopConstraint = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        headerView.weatherLabel.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
        headerView.weatherLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor).isActive = true
        headerView.weatherLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor).isActive = true
        headerView.weatherLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            headerViewTopConstraint!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setUp() {
        view.backgroundColor = .systemBlue
        hourlyCollectionView.delegate = self
        hourlyCollectionView.dataSource = self
        self.scrollView.delegate = self
    }
    
    private func setLabels() {
        headerView.weatherLabel.text = """
                                      \(weather?.data.first?.cityName ?? "")
                                      \(weather?.data.first?.tempString ?? "")°C \(weather?.data.first?.weather.weatherDescription ?? "")
                                      """
        pressure.text = "Average pressure is \(weather?.data.first?.pres.rounded() ?? 0.0) mb."
        windSpeed.text = "Average wind speed is \(weather?.data.first?.windSpd.rounded() ?? 0.0) m/s."
        humidity.text = "Average relative humidity is \(weather?.data.first?.rh ?? 0) %."
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
