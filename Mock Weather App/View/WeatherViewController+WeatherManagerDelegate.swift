//
//  WeatherViewController+WeatherManagerDelegate.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/06/27.
//

import UIKit

extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.view.backgroundColor = weather.backgroundColor
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
