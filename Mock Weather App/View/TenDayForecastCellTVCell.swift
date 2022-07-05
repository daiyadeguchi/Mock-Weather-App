//
//  TenDayForecastCellTVCell.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/07/05.
//

import UIKit

class TenDayForecastCellTVCell: UITableViewCell, WeatherManagerDelegate {
    
    var weatherManager = WeatherManager()
    
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
        weatherManager.delegate = self
        weatherManager.fetchWeather(cityName: "Tokyo")
        setupCell()
    }
    
    private func setupCell() {
        addSubview(day)
        addSubview(weatherImage)
        addSubview(minTemp)
        addSubview(maxTemp)
        
        NSLayoutConstraint.activate([
            day.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            day.leadingAnchor.constraint(equalTo: leadingAnchor),
            day.trailingAnchor.constraint(equalTo: weatherImage.leadingAnchor),
            day.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            weatherImage.topAnchor.constraint(equalTo: topAnchor),
            weatherImage.leadingAnchor.constraint(equalTo: day.trailingAnchor),
            weatherImage.trailingAnchor.constraint(equalTo: minTemp.leadingAnchor),
            weatherImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            minTemp.topAnchor.constraint(equalTo: topAnchor),
            minTemp.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor),
            minTemp.trailingAnchor.constraint(equalTo: maxTemp.leadingAnchor),
            minTemp.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            maxTemp.topAnchor.constraint(equalTo: topAnchor),
            maxTemp.leadingAnchor.constraint(equalTo: minTemp.trailingAnchor),
            maxTemp.trailingAnchor.constraint(equalTo: trailingAnchor),
            maxTemp.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TenDayForecastCellTVCell {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
