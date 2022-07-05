//
//  CurrentWeatherCell.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/06/29.
//

import UIKit

class CurrentWeatherCell: UITableViewCell {
    
    var weatherManager = WeatherManager()
    
    var containerView: UIView = {
        var container = UIView()
        container.layer.cornerRadius = 10
        container.backgroundColor = .gray.withAlphaComponent(0.1)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
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
        addSubview(containerView)
        containerView.addSubview(topLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            topLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 50),
            topLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            topLabel.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
