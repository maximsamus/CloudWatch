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
    
    func configure(weather: Datum) {
        NetworkManager.shared.getTimeFromTimeZone(from: weather.timezone) { time in
            self.timeLabel.text = time
        }
        tempLabel.text = "\(weather.tempString)°C"
        cityLabel.text = weather.cityName
        weatherImage.image = UIImage(systemName: weather.weather.conditionName)
        //
//        func awakeFromNib() {
//                super.awakeFromNib()
//            }
//        //
        //    override func setSelected(_ selected: Bool, animated: Bool) {
        //        super.setSelected(selected, animated: animated)
        //    }
    }
}
