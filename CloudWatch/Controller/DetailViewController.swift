//
//  DetailViewController.swift
//  CloudWatch
//
//  Created by Максим Самусь on 13.12.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var descriptionWeather: UILabel!
    
    var weather: WeatherResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setLabels()
    }
    
     private func setLabels() {
        cityName.text = weather?.data.first?.cityName
         temp.text = "\(weather?.data.first?.tempString ?? "")°C"
        descriptionWeather.text = weather?.data.first?.weather.weatherDescription
    }
}
