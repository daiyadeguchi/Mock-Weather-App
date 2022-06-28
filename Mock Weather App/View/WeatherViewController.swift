//
//  ViewController.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/06/24.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate {
    
    var weatherManager = WeatherManager()
    var tableView: UITableView = UITableView()
    
    let sectionTitle = [
        "Current", "HOURLY FORECAST", "10-DAY FORECAST"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.register(CurrentWeatherCell.self, forCellReuseIdentifier: "cellId")
    }

}
