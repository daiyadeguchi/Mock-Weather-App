//
//  ForecastModel.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/07/10.
//

import Foundation

struct ForecastModel {
    let conditionId: Int
    let temp: String
    let tempMin: String
    let tempMax: String
    let date: String
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "cloud"
        }
    }
}
