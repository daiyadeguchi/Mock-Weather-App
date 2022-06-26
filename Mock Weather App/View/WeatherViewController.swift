//
//  ViewController.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/06/24.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var weatherManager = WeatherManager()
    
    private let backgroundColor: UIColor = {
        var bgColor = UIColor()
        return bgColor
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        setupView()
    }
    
    private func setupView() {
        weatherManager.fetchWeather(cityName: "Tokyo")
    }


}

extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        print(weather)
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}

