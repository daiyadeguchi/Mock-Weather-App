//
//  ViewController.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/06/24.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate {
    
    let currentWeatherCellId = "currentWeatherCellId"
    let hourlyWeatherCellId = "hourlyWeatherCellId"
    let tenDayWeatherCellId = "tenDayWeatherCellId"
    
    lazy var searchTextField: UITextField = {
        var tf = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        tf.backgroundColor = .secondarySystemBackground
        tf.placeholder = "Enter City Name"
        
        tf.leftViewMode = .always
        let imageview = UIImageView(frame: CGRect(x: 50, y: 0, width: 20, height: 20))
        let image = UIImage(systemName: "magnifyingglass")
        imageview.image = image
        tf.leftView = imageview
        
        tf.tintColor = .clear
        tf.layer.cornerRadius = 20
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    var containerView: UIView = {
        var view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var tableView: UITableView = {
        var table = UITableView()
        table.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        table.delegate = self
        table.dataSource = self
        table.allowsSelection = false
        table.separatorColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.register(CurrentWeatherCell.self, forCellReuseIdentifier: currentWeatherCellId)
        table.register(HourlyWeatherCell.self, forCellReuseIdentifier: hourlyWeatherCellId)
        table.register(FiveDayForecast.self, forCellReuseIdentifier: tenDayWeatherCellId)
        
        return table
    }()
    
    let sectionTitle = [
        "", "🕘 3 HOUR FORECAST", "🗓 5-DAY FORECAST"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        containerView.addSubview(searchTextField)
        view.addSubview(containerView)
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 40),
            
            searchTextField.topAnchor.constraint(equalTo: containerView.topAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            searchTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            searchTextField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("enter")
        return true
    }
}
