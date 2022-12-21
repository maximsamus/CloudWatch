//
//  HeaderView.swift
//  CloudWatch
//
//  Created by Максим Самусь on 16.12.2022.
//

import UIKit

final class HeaderView: UIView {
    
    let weatherLabel = UILabel()
    var heightConstraint: NSLayoutConstraint?
    
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
        weatherLabel.font = .systemFont(ofSize: 50)
        weatherLabel.textColor = .white
        weatherLabel.textAlignment = .center
        weatherLabel.lineBreakMode =  .byClipping
        weatherLabel.numberOfLines = 0
    }
    
    func layout() {
        addSubview(weatherLabel)
        
        heightConstraint = weatherLabel.heightAnchor.constraint(equalToConstant: 300)
        
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            weatherLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: weatherLabel.trailingAnchor, multiplier: 1),
            heightConstraint!
        ])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        guard let heightConstraint = heightConstraint else { return }
        let normalizedScroll = y / 2
        heightConstraint.constant = 300 - normalizedScroll
        if heightConstraint.constant <= 200 {
            heightConstraint.constant = 200
        }
        let maxFontSize: CGFloat = 50
        let minFontSize: CGFloat = 25
        let maxScrollPosition = scrollView.contentSize.height - scrollView.frame.size.height
        let fontSize = maxFontSize - (maxFontSize - minFontSize) * (y / maxScrollPosition)
        weatherLabel.font = weatherLabel.font.withSize(fontSize)
    }
}
