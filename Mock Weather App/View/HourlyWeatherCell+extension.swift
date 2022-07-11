//
//  HourlyWeatherCell+extension.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/07/12.
//

import UIKit

extension HourlyWeatherCell {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! HourlyWeatherCellCVCell
        
        if !list.isEmpty {
            if let item = list[indexPath.row] {
                if indexPath.row == 0 {
                    cell.timeLabel.text = "Now"
                } else {
                    cell.timeLabel.text = getHour(item.date)
                }
                cell.weatherImage.image = UIImage(systemName: item.conditionName)
                cell.tempLabel.text = item.temp
            }
        }
        return cell
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
    
    func didUpdateWeather(_ forecastManager: ForecastManager, forecast: Array<ForecastModel?>) {
        DispatchQueue.main.async {
            for numberOfCell in 0...23 {
                if let item = forecast[numberOfCell] {
                    self.list.append(ForecastModel(conditionId: item.conditionId, temp: String(item.temp), tempMin: item.tempMin, tempMax: item.tempMax, date: item.date))
                }
            }
            self.weatherCollectionView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
