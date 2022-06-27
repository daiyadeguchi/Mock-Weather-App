//
//  ViewController.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/06/24.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var weatherManager = WeatherManager()
    
    let topLabel: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "--")
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        setupView()
    }
    
    private func setupView() {
        view.addSubview(topLabel)
        weatherManager.fetchWeather(cityName: "Tokyo")
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            topLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            topLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
