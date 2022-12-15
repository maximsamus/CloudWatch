//
//  ForecastCell.swift
//  CloudWatch
//
//  Created by Максим Самусь on 15.12.2022.
//

import UIKit

final class ForecastCell: UICollectionViewCell {
    
    static let identifier = "ForecastCell"
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!

    func configure(weather: DataResponse) {
        let dateString = weather.timestampLocal
//        print(dateString)
//        print(weather.timestampUTC)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let date = dateFormatter.date(from: dateString) else { return }
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour], from: date)
        guard let hour = components.hour else { return }
//        print(hour)
        tempLabel.text = "\(weather.tempString)°C"
        hourLabel.text = "\(hour):00"
        imageView.image = UIImage(systemName: weather.weather.conditionName)
    }
}

