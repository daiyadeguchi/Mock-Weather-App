//
//  ForecastData.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/07/09.
//

import Foundation

struct ForecastData: Codable {
    let list: Array<List>
}

struct List: Codable {
    let main: Main
    let weather: [Weather]
    let dt_txt: String
}

