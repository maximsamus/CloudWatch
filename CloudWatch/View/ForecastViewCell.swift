//
//  ForecastViewCell.swift
//  CloudWatch
//
//  Created by Максим Самусь on 14.12.2022.
//

import UIKit

class ForecastViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
//        let cell = MyCollectionViewCell(frame: .zero)
//        self.reuseIdentifier = "MyCellReuseIdentifier"
    }
    func configure(weather: Datum) {
//        let indexCount = weather[index]
        tempLabel.text = "\(weather.tempString)°C"
//        hourLabel.text = "\(indexCount)"
        iconImage.image = UIImage(systemName: weather.weather.conditionName)
    }
}
