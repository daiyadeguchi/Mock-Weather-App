//
//  WeatherModel.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/06/26.
//

import Foundation
import UIKit

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String.init(format: "%.1f", temperature)
    }
    
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
    
    var backgroundColor: UIColor {
        switch conditionId {
        case 200...232:
            return UIColor(ciColor: .gray)
        case 300...321:
            return UIColor(ciColor: .blue)
        case 500...531:
            return UIColor(ciColor: .blue)
        case 600...622:
            return UIColor(ciColor: .white)
        case 701...781:
            return UIColor(ciColor: .white)
        case 800:
            return UIColor(ciColor: .yellow)
        case 801...804:
            return UIColor(ciColor: .gray)
        default:
            return UIColor(ciColor: .gray)
        }
    }
}
