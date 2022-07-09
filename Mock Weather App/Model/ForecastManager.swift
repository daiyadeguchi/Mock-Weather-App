//
//  ForecastManager.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/07/08.
//

import Foundation

protocol ForecastManagerDelegate {
    func didUpdateWeather(_ forecastManager: ForecastManager, forecast: WeatherModel)
    func didFailWithError(error: Error)
}

struct ForecastManager {
    let apiKey: String = {
        if let filePath = Bundle.main.path(forResource: "OpenWeather-Info", ofType: "plist") {
            if let value = NSDictionary(contentsOfFile: filePath)?.object(forKey: "API_KEY") as? String {
                return value
            }
        }
        return ""
    }()
    
    var delegate: ForecastManagerDelegate?
    
    func fetchForecast(cityName: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?appid=\(apiKey)&units=metric&q=\(cityName)"
        if let safeURL = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            performRequest(with: safeURL)
        }
    }
    
    func fetchForecast(latitude: Double, longitude: Double) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?appid=\(apiKey)&units=metric&lat=\(latitude)&lon=\(longitude)"
        if let safeURL = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            performRequest(with: safeURL)
        }
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let forecast = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, forecast: forecast)
                    }
                }
            })
            task.resume()
        }
    }
    
    func parseJSON(_ forecastData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ForecastData.self, from: forecastData)
            let id = decodedData.list[0].weather[0].id
            let temp = decodedData.list[0].main.temp
            let tempMin = decodedData.list[0].main.temp_min
            let tempMax = decodedData.list[0].main.temp_max
            print(decodedData.list)
            
            let forecast = WeatherModel(conditionId: id, cityName: "Tokyo", temperature: temp, tempMin: tempMin, tempMax:tempMax)
            return forecast
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
