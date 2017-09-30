//
//  ChartViewController.swift
//  Dashboard
//
//  Created by Muhammad Yusuf on 9/29/17.
//  Copyright © 2017 Rekon. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController {
    
    @IBOutlet weak var chartScrollView: UIScrollView!
    @IBOutlet weak var chartStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initChartViews()
    }
    
    private func initChartViews() {
        let chartView = DashboardChart()
        
        chartStackView.addArrangedSubview(chartView)
        
        chartView.widthAnchor.constraint(equalTo: chartScrollView.widthAnchor, multiplier: 1).isActive = true
        chartView.heightAnchor.constraint(equalTo: chartScrollView.heightAnchor, multiplier: 1).isActive = true
        chartView.centerXAnchor.constraint(equalTo: chartStackView.centerXAnchor, constant: 0.333).isActive = true
        chartView.centerYAnchor.constraint(equalTo: chartStackView.centerYAnchor).isActive = true
        
        
    }
}
