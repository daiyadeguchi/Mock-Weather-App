//
//  TenDayForecastCell.swift
//  Mock Weather App
//
//  Created by Daiya Deguchi on 2022/07/05.
//

import UIKit

class TenDayForecastCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    lazy var tableView: UITableView = {
        var table = UITableView()
        table.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        table.delegate = self
        table.dataSource = self
        table.allowsSelection = false
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    var containerView: UIView = {
        var container = UIView()
        container.layer.cornerRadius = 10
        container.backgroundColor = .gray.withAlphaComponent(0.1)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTableView()
    }
    
    private func setupTableView() {
        
        
        setupContainer()
        tableView.register(TenDayForecastCellTVCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupContainer() {
        addSubview(containerView)
        containerView.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: containerView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TenDayForecastCell {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TenDayForecastCellTVCell
        return cell
    }
    
}
