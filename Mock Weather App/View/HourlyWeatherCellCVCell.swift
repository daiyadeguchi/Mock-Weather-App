//
//  HourlyWeatherCellCVCell.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/06/30.
//

import UIKit

class HourlyWeatherCellCVCell: UICollectionViewCell {
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weatherImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "sun.max") ?? UIImage()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .label
        return image
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.text = "30"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(timeLabel)
        addSubview(weatherImage)
        addSubview(tempLabel)
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: topAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: weatherImage.topAnchor),
            
            weatherImage.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
            weatherImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            weatherImage.heightAnchor.constraint(equalToConstant: 30),
            
            tempLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor),
            tempLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            tempLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            tempLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
