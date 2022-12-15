//
//  ForecastCell.swift
//  CloudWatch
//
//  Created by Максим Самусь on 15.12.2022.
//

import UIKit

class ForecastCell: UICollectionViewCell {
    
    static let identifier = "ForecastCell"
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    
    //    override init(frame: CGRect) {
//        super.init(frame: frame)
//        contentView.backgroundColor = .systemBlue
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        setup()
//
//    }
//    func configure(weather: Datum) {
////        let indexCount = weather[index]
//        tempLabel.text = "\(weather.tempString)°C"
////        hourLabel.text = "\(indexCount)"
//        iconImage.image = UIImage(systemName: weather.weather.conditionName)
//    }
//    func setup() {
//        cellView.backgroundColor = .black
//        print("1111")
//    }
}

