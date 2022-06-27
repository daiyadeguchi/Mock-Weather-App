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
    let tempMin: Double
    let tempMax: Double
    
    var conditionDescription: String {
        switch conditionId {
        case 200...232:
            return "Thunder Storm"
        case 300...321:
            return "Drizzle"
        case 500...531:
            return "Rainy"
        case 600...622:
            return "Snowy"
        case 701...781:
            return "Foggy"
        case 800:
            return "Sunny"
        case 801...804:
            return "Cloudy"
        default:
            return "--"
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
