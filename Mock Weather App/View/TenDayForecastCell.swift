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
        table.layer.cornerRadius = 10
        table.backgroundColor = .gray.withAlphaComponent(0.1)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTableView()
    }
    
    private func setupTableView() {
        setupTable()
        tableView.register(TenDayForecastCellTVCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupTable() {
        addSubview(tableView)
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

//MARK: - UITableView

extension TenDayForecastCell {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TenDayForecastCellTVCell
        return cell
    }
    
}
