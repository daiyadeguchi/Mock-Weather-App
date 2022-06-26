//
//  ViewController.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/06/24.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var weatherManager = WeatherManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        setupView()
    }
    
    private func setupView() {
        weatherManager.fetchWeather(cityName: "Tokyo")
    }

}
