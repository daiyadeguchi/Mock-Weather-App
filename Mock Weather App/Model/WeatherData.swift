//
//  WeatherData.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/06/26.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct Weather: Codable {
    let id: Int
}
