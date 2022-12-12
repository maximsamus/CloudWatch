//
//  CityCell.swift
//  CloudWatch
//
//  Created by Максим Самусь on 9.12.2022.
//

import UIKit

class CityCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var cityViewCell: UIView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    
    func configure(weather: WeatherResponse) {
//        let time = Date(timeIntervalSince1970: Double(weather.current.dt))
        timeLabel.text = Date(timeIntervalSince1970: Double(weather.current.dt)).description
        tempLabel.text = String(weather.current.temp)
//        weatherImage.image =
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
