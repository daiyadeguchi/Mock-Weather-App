//
//  TenDayForecastCellTVCell.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/07/05.
//

import UIKit

class TenDayForecastCellTVCell: UITableViewCell {
    
    let day: UILabel = {
        var day = UILabel()
        day.text = "Today"
        day.translatesAutoresizingMaskIntoConstraints = false
        return day
    }()
    
    let weatherImage: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(systemName: "sun.max")
        imageView.tintColor = .label
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let minTemp: UILabel = {
        var min = UILabel()
        min.text = "20"
        min.translatesAutoresizingMaskIntoConstraints = false
        return min
    }()
    
    let maxTemp: UILabel = {
       var max = UILabel()
        max.text = "30"
        max.translatesAutoresizingMaskIntoConstraints = false
        return max
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupCell()
    }
    
    private func setupCell() {
        
        let tempStack = UIStackView(arrangedSubviews: [minTemp, maxTemp])
        tempStack.translatesAutoresizingMaskIntoConstraints = false
        tempStack.distribution = .fillEqually
        
        let forecastStack = UIStackView(arrangedSubviews: [day, weatherImage, tempStack])
        forecastStack.translatesAutoresizingMaskIntoConstraints = false
        forecastStack.distribution = .fillEqually
        
        addSubview(forecastStack)
        NSLayoutConstraint.activate([
            forecastStack.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            forecastStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            forecastStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            forecastStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
