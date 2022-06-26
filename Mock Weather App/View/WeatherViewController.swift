//
//  ViewController.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/06/24.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private let backgroundColor: UIColor = {
        var bgColor = UIColor()
        return bgColor
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        if let filePath = Bundle.main.path(forResource: "OpenWeather-Info", ofType: "plist") {
            if let value = NSDictionary(contentsOfFile: filePath)?.object(forKey: "API_KEY") as? String {
                print(value)
            }
                
        }
        
    }


}

