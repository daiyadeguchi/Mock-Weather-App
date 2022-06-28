//
//  CurrentWeatherCell.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/06/29.
//

import UIKit

class CurrentWeatherCell: UITableViewCell {
    
    var weatherManager = WeatherManager()
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "--")
        label.attributedText = attributedText
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.numberOfLines = 4
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        weatherManager.delegate = self
        weatherManager.fetchWeather(cityName: "Tokyo")
        addSubview(topLabel)
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            topLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            topLabel.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
