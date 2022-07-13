//
//  TenDayForecastCell.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/07/05.
//

import UIKit

class TenDayForecastCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource, ForecastManagerDelegate {
    
    var manager = ForecastManager()
    var list = Array<ForecastModel?>()
    
    lazy var tableView: UITableView = {
        var table = UITableView()
        table.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        table.delegate = self
        table.dataSource = self
        table.allowsSelection = false
        table.layer.cornerRadius = 10
        table.backgroundColor = .gray.withAlphaComponent(0.1)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        manager.delegate = self
        manager.fetchForecast(cityName: "Tokyo")
        setupTableView()
    }
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.register(TenDayForecastCellTVCell.self, forCellReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UITableView, ForecastManagerDelegate

extension TenDayForecastCell {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TenDayForecastCellTVCell
        
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
            for numberOfCell in 0...39 {
                if let item = forecast[numberOfCell]{
                    
                    if self.getHour(item.date) == "21" {
                        self.list.append(ForecastModel(conditionId: item.conditionId, temp: item.temp, tempMin: item.tempMin, tempMax: item.tempMax, date: item.date))
                        
                    }
                }
            }
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
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
    
}
