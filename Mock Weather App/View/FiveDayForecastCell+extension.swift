//
//  TenDayForecastCell+extension.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/07/15.
//

import UIKit

extension FiveDayForecast {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FiveDayForecastCellTVCell
        
        if !list.isEmpty {
            if let item = list[indexPath.row] {
                cell.weatherImage.image = UIImage(systemName: item.conditionName)
                cell.minTemp.text = String(item.tempMin)
                cell.maxTemp.text = String(item.tempMax)
                cell.day.text = getDay(item.date)
            }
        }
        return cell
    }
    
    private func getDay(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: dateString)
        let weekdayList = dateFormatter.shortWeekdaySymbols
        if let weekdayInt = Calendar.current.dateComponents([.weekday], from: date ?? Date()).weekday {
            return weekdayList?[weekdayInt - 1] ?? "--"
        }
        return "--"
    }

    
    func didUpdateWeather(_ forecastManager: ForecastManager, forecast: Array<ForecastModel?>) {
        DispatchQueue.main.async {
            var tempMin = 0
            var tempMax = 0
            for numberOfCell in 0...39 {
                if let item = forecast[numberOfCell]{
                    // Set minimum/maximum temperature for each day
                    let itemTempMin = Int(item.tempMin) ?? 0
                    let itemTempMax = Int(item.tempMax) ?? 0
                    
                    if self.getHour(item.date) == "0" {
                        tempMin = itemTempMin
                        tempMax = itemTempMax
                    }
                    if tempMin > itemTempMin {
                        tempMin = itemTempMin
                    }
                    if tempMax < itemTempMax {
                        tempMax = itemTempMax
                    }
                    
                    // Initiate ForecastModel w/ tempMin and tempMax above instead of item values
                    if self.getHour(item.date) == "21" {
                        self.list.append(ForecastModel(conditionId: item.conditionId, temp: item.temp, tempMin: String(tempMin), tempMax: String(tempMax), date: item.date))
                    }
                }
            }
            self.tableView.reloadData()
        }
    }
    
    private func getHour(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: dateString)
        if let hour = Calendar.current.dateComponents([.hour], from: date ?? Date()).hour {
            return String(hour)
        }
        return "0"
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}
