//
//  CityCell.swift
//  CloudWatch
//
//  Created by Максим Самусь on 9.12.2022.
//

import UIKit

class CityCell: UITableViewCell {

    @IBOutlet weak var cityViewCell: UIView!
    @IBOutlet weak var timeLabel: UIStackView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
