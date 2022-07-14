//
//  ViewController.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/06/24.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate {
    
    let currentWeatherCellId = "currentWeatherCellId"
    let hourlyWeatherCellId = "hourlyWeatherCellId"
    let tenDayWeatherCellId = "tenDayWeatherCellId"
    
    var tableView: UITableView = UITableView()
    
    let sectionTitle = [
        "", "🕘 3 HOUR FORECAST", "🗓 5-DAY FORECAST"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.separatorColor = .clear
        view.addSubview(tableView)
        
        tableView.register(CurrentWeatherCell.self, forCellReuseIdentifier: currentWeatherCellId)
        tableView.register(HourlyWeatherCell.self, forCellReuseIdentifier: hourlyWeatherCellId)
        tableView.register(FiveDayForecast.self, forCellReuseIdentifier: tenDayWeatherCellId)
    }
    
}
