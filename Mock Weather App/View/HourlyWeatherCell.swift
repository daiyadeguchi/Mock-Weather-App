//
//  HourlyWeatherCell.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/06/30.
//

import UIKit

class HourlyWeatherCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
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
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupWeatherCollectionView()
    }
    
    private func setupWeatherCollectionView() {
        addSubview(weatherCollectionView)
        weatherCollectionView.register(HourlyWeatherCellCVCell.self, forCellWithReuseIdentifier: "cellId")
        
        NSLayoutConstraint.activate([
            weatherCollectionView.topAnchor.constraint(equalTo: topAnchor),
            weatherCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            weatherCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! HourlyWeatherCellCVCell
        return cell
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
