//
//  WeatherViewController+WeatherManagerDelegate.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/06/27.
//

import UIKit

extension CurrentWeatherCell: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            // Setup top/current weather view
            let attributedText = NSMutableAttributedString(string: weather.cityName, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)])
            attributedText.append(NSAttributedString(string: "\n\(Int(weather.temperature))°", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 70)]))
            attributedText.append(NSAttributedString(string: "\n\(weather.conditionDescription)", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)]))
            attributedText.append(NSAttributedString(string: "\nH:\(Int(weather.tempMax))° L:\(Int(weather.tempMin))°", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)]))
            self.topLabel.attributedText = attributedText
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
