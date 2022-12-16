//
//  HeaderView.swift
//  CloudWatch
//
//  Created by Максим Самусь on 16.12.2022.
//

import UIKit

class HeaderView: UIView {
    
    let weatherLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderView {
    func style() {
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        weatherLabel.font = .systemFont(ofSize: 45)
        weatherLabel.textColor = .white
        weatherLabel.textAlignment = .center
        weatherLabel.lineBreakMode = .byWordWrapping
        weatherLabel.numberOfLines = 0
    }
    
    func layout() {
        addSubview(weatherLabel)
        
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            weatherLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: weatherLabel.trailingAnchor, multiplier: 1)
        ])
    }
}
