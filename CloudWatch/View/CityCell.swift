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
        timeLabel.text = weather.datetime
        tempLabel.text = weather.tempString
        cityLabel.text = weather.cityName
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
