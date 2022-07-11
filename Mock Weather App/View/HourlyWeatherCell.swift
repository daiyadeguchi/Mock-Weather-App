//
//  HourlyWeatherCell.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/06/30.
//

import UIKit

class HourlyWeatherCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, ForecastManagerDelegate {
    
    var manager = ForecastManager()
    var list = Array<ForecastModel?>()
    
    var containerView: UIView = {
        var container = UIView()
        container.layer.cornerRadius = 10
        container.backgroundColor = .gray.withAlphaComponent(0.1)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    lazy var weatherCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 35, height: 80)
        flowLayout.minimumLineSpacing = 15
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height), collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        manager.delegate = self
        manager.fetchForecast(cityName: "Tokyo")
        setupWeatherCollectionView()
    }
    
    private func setupWeatherCollectionView() {
        contentView.addSubview(containerView)
        containerView.addSubview(weatherCollectionView)
        weatherCollectionView.register(HourlyWeatherCellCVCell.self, forCellWithReuseIdentifier: "cellId")
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            weatherCollectionView.topAnchor.constraint(equalTo: containerView.topAnchor),
            weatherCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            weatherCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            weatherCollectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! HourlyWeatherCellCVCell
        
        if !list.isEmpty {
            if let item = list[indexPath.row] {
                if indexPath.row == 0 {
                    cell.timeLabel.text = "Today"
                }
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                let date = dateFormatter.date(from: item.date)
                print(date)
                cell.weatherImage.image = UIImage(systemName: item.conditionName)
                cell.tempLabel.text = item.temp
            }
        }
        return cell
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
